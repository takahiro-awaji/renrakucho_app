class PostsController < ApplicationController

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
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
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

  def post_params
    params.require(:posts_tag).permit(:title, :content, :image, :name).merge(user_id: current_user.id)
  end
end
