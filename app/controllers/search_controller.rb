class SearchController < ApplicationController
  def index
    unless params[:query].nil?
      session[:query] = params[:query]
    end

    unless session[:query].nil?
      @search = Petition.where("title LIKE :query OR description LIKE :query", query: "%#{session[:query]}%").order(created_at: :desc)
    else
      @search = Petition.none
    end

    @pagy, @petitions = pagy_countless(@search, items: 3)

    respond_to do |format|
      format.html # GET
      format.turbo_stream # POST
    end
  end
end
