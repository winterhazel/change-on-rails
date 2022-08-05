class ApplicationController < ActionController::Base
  include Pagy::Backend

  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  def index
    @complete_search_result = Petition.order("created_at DESC")
    @pagy, @petitions = pagy_countless(@complete_search_result, items: 3)

    respond_to do |format|
      format.html # GET
      format.turbo_stream # POST
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :surname])
  end
end
