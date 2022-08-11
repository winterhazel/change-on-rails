class PetitionsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def index
    @search = Petition.where("status != 'closed'")
    @search = case params[:selected]
              when "recent"
                @search.where("status != 'victory'").order("created_at DESC")
              when "victories"
                @search.where("status == 'victory'").order("updated_at DESC")
              else
                @search.where("status != 'victory'").left_joins(:signatures).group(:id).order("COUNT(signatures.id) DESC")
              end

    @pagy, @petitions = pagy_countless(@search, items: 3)

    respond_to do |format|
      format.html { create if request.post? }
      format.turbo_stream
    end
  end

  def show
    @petition = Petition.find(params[:id])
    @current_signature = @petition.signatures.find_by_user_id(current_user.id) if user_signed_in?
    @signatures = @petition.signatures.where("private == FALSE and LENGTH(message) > 0")
  end

  def new
    unless user_signed_in?
      redirect_to "#{new_user_session_path}?redirect_to=#{new_petition_path}"
      return
    end

    @petition = Petition.new
  end

  def create
    unless user_signed_in?
      redirect_to "#{new_user_session_path}?redirect_to=#{new_petition_path}"
      return
    end

    @petition = current_user.petitions.create(petition_params)

    if @petition.save
      redirect_to @petition
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @petition = Petition.find(params[:id])

    unless can_edit?(@petition)
      redirect_to petition_path
    end
  end

  def update
    @petition = Petition.find(params[:id])

    unless can_edit?(@petition)
      redirect_to petition_path
      return
    end

    @petition.description = petition_params[:description] unless petition_params[:description].nil?
    @petition.picture = petition_params[:picture] unless petition_params[:picture].nil?

    if @petition.save
      redirect_to @petition
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    redirect_to petition_path
  end

  def declare_victory
    @petition = Petition.find(params[:id])

    unless can_edit?(@petition)
      redirect_to petition_path
      return
    end

    @petition.status = :victory
    @petition.save

    redirect_to petition_path
  end

  def close_petition
    @petition = Petition.find(params[:id])

    unless can_edit?(@petition)
      redirect_to petition_path
      return
    end

    @petition.status = :closed
    @petition.save

    redirect_to petition_path
  end

  private

  def petition_params
    params.require(:petition).permit(:title, :description, :picture).with_defaults(goal: 100, status: :open)
  end

  def can_edit? (petition)
    user_signed_in? && petition.user.id == current_user.id && petition.status == 'open'
  end

  def record_not_found
    redirect_to petitions_path
  end
end

