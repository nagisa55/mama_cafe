class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.user
    @comments = @post.comments
    @comment = current_user.comments.new
  end

  def create
    @post = current_user.posts.build(micropost_params)
    if @post.save
      flash[:success] = "投稿しました。"
      redirect_to @user
    else
      @posts = []
      flash[:danger] = "投稿出来ませんでした。"
      render :new
    end
  end

  def destroy
    @post.destroy
    flash[:success] = "投稿を削除しました。"
  end

  def edit
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:content, :photo)
  end


end
