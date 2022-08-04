class CommentsController < ApplicationController
  def index
    @petition = Petition.find(params[:id])
    @signatures = @petition.signatures.order("created_at DESC")
  end
end
