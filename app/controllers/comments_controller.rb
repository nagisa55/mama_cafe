class CommentsController < ApplicationController
  before_action :require_logged_in

  def create
    @comment = current_user.comments.build(comment_params)
    @comment.post_id = params[:post_id]
    if @comment.save
      flash[:success] = "コメントしました"
      redirect_to @comment.post
    else
      flash[:danger] = "コメント出来ませんでした。"
      render :create
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
