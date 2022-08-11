class UsersController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def show
    return redirect_to "#{new_user_session_path}?redirect_to=/users/#{params[:id]}" unless user_signed_in?

    @user = params[:id] == "me" ? current_user : User.find(params[:id])
    @search = case params[:selected]
              when "signed"
                @user.signatures
              else
                @user.petitions
              end
    @pagy, @petitions = pagy_countless(@search.order(created_at: :desc), items: 3)
    @petitions.map! {|signature| signature.petition} if params[:selected] == "signed" # Get the petitions

    respond_to do |format|
      format.html
      format.turbo_stream
    end
  end

  private

  def record_not_found
    redirect_to root_path
  end
end
