class UsersController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def show
    unless user_signed_in?
      redirect_to "#{new_user_session_path}?redirect_to=/users/#{params[:id]}"
      return
    end

    @user = params[:id] == "me" ? current_user : User.find(params[:id])
    @petitions = @user.petitions.order(created_at: :desc)
    @signatures = @user.signatures.order(created_at: :desc)
  end

  private

  def record_not_found
    redirect_to root_path
  end
end
