class SearchController < ApplicationController
  def index
    @complete_search_result = Petition.where("title LIKE :query OR description LIKE :query", query: "%#{params[:query]}%").order(created_at: :desc)
    @pagy, @petitions = pagy_countless(@complete_search_result, items: 5)

    respond_to do |format|
      format.html # GET
      format.turbo_stream # POST
    end
  end
end
