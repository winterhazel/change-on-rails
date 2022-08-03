class UsersController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def show
    unless user_signed_in?
      redirect_to new_user_session_path
      return
    end
    if params[:id] == "me"
      @user = current_user
    else
      @user = User.find(params[:id])
    end
    @petitions = @user.petitions
    @signatures = @user.signatures
  end

  private

  def record_not_found
    redirect_to root_path
  end
end
