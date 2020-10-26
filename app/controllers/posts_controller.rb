class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @post = Post.new
    @posts = Post.all.order(created_at: :desc)
  end

  def new
    @post = PostsTag.new
  end

  def create
    @post = PostsTag.new(post_params)
    if @post.valid?
      @post.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @post.update(post_update_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    if @post.destroy
      redirect_to root_path
    else
      render 'index'
    end
  end

  def search
    @posts = Post.search(params[:keyword])
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:posts_tag).permit(:title, :content, :image, :name).merge(user_id: current_user.id)
  end

  def post_update_params
    params.require(:post).permit(:title, :content, :image).merge(user_id: current_user.id)
  end

end
