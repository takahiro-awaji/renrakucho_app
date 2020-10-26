class LikesController < ApplicationController
  before_action :set_post
  before_action :authenticate_user!

  def create
    if @post.user_id != current_user.id
      @like = Like.create(user_id: current_user.id, post_id: @post.id)
      redirect_to root_path, notice: "投稿を保存したよ"
    else
      render "posts/#{@post.id}"
    end
  end

  def destroy
    @like = Like.find_by(user_id: current_user.id, post_id: @post.id)
    @like.destroy
    redirect_to root_path, notice: "保存を解除したよ"
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

end