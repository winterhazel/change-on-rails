class ApplicationController < ActionController::Base
  include Pagy::Backend
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def index
    @search = Petition.order("created_at DESC")
    @pagy, @petitions = pagy_countless(@search, items: 3)

    respond_to do |format|
      format.html
      format.turbo_stream
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :surname])
  end
end
