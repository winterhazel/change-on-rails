class CommentsController < ApplicationController
  def index
    @petition = Petition.find(params[:petition_id])
  end

  def create
    @petition = Petition.find(params[:petition_id])
    @comment = @petition.comments.create(comment_params)
    redirect_to petition_comments_path(@petition)
  end

  def destroy
    @petition = Petition.find(params[:petition_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to petition_comments_path(@petition)
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :status).with_defaults(user_id: current_user.id)
  end
end
