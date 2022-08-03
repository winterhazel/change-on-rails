class PetitionsController < ApplicationController
  def index
    @petitions = Petition.all
  end

  def show
    @petition = Petition.find(params[:id])
    @current_signature = Signature.find_by_user_id(current_user.id)
  end

  def new
    if !user_signed_in?
      redirect_to new_user_session_path
      return
    end

    @petition = Petition.new
  end

  def create
    @petition = current_user.petitions.create(petition_params)

    if @petition.save
      redirect_to @petition
    else
      render :new, status: :unprocessable_entity
    end

    def edit
      @petition = Petition.find(params[:id])
    end

    def update
      @petition = Petition.find(params[:id])

      if @petition.update(petition_params)
        redirect_to @petition
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @petition = Petition.find(params[:id])
      @petition.destroy

      redirect_to root_path, status: :see_other
    end
  end

  private

  def petition_params
    params.require(:petition).permit(:title, :description, :goal, :status).with_defaults(signatures: 0)
  end
end
