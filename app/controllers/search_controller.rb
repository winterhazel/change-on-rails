# frozen_string_literal: true

class SearchController < ApplicationController
  def index
    session[:query] = params[:query] unless params[:query].nil?
    @search = if session[:query].nil?
                Petition.none
              else
                Petition.where('title LIKE :query OR description LIKE :query',
                               query: "%#{session[:query]}%").order(created_at: :desc)
              end
    @pagy, @petitions = pagy_countless(@search, items: 3)

    respond_to do |format|
      format.html
      format.turbo_stream
    end
  end
end
