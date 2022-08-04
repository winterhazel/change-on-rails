class SearchController < ApplicationController
  def index
    if params[:query].present?
      @petitions = Petition.where("title LIKE :query OR description LIKE :query", query: "%#{params[:query]}%")
    end
  end

  def query
    redirect_to "/search?query=" + params[:query]
  end
end
