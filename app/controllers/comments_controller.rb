class CommentsController < ApplicationController
  def index
    @petition = Petition.find(params[:id])
  end
end
