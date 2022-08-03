class CommentsController < ApplicationController
  def create
    @petition = Petition.find(params[:petition_id])
    @comment = @petition.comments.create(comment_params)
    redirect_to petition_path(@petition)
  end

  def destroy
    @petition = Petition.find(params[:petition_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to petition_path(@petition), status: 303
  end

  private
  def comment_params
    params.require(:comment).permit(:commenter, :content, :status)
  end
end
