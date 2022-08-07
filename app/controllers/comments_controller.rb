class CommentsController < ApplicationController
  def index
    @petition = Petition.find(params[:id])
    @search = @petition.signatures.order("created_at DESC")

    if @search.size == 0
      redirect_to petition_path(@petition)
    end

    @pagy, @signatures = pagy_countless(@search, items: 3)

    respond_to do |format|
      format.html
      format.turbo_stream
    end
  end
end
