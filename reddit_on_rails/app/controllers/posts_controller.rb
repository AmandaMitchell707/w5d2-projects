class PostsController < ApplicationController
  before_action :require_login, only: [:new, :create, :edit, :update, :destroy]
  before_action :find_post, only: [:edit, :update, :show, :destroy]
  
  def new
    @post = Post.new
    render :new
  end

  def create
    @post = Post.new(post_params)
    @post.author_id = params[:user_id]
    if @post.save
      redirect_to sub_url(@post.sub_id)
    else 
      now_errors(@post)
      render :new
    end 
  end

  def show
    render :show
  end

  def destroy
    sub_id = @post.sub_id
    @post.destroy
    redirect_to sub_url(sub_id)
  end

  def edit
    if @post.author_id == current_user.id
      render :edit
    else 
      redirect_to sub_url(@post.sub_id)
    end 
  end

  def update
    if @post.author_id == current_user.id
      if @post.update(post_params)
        redirect_to sub_url(@post.sub_id)
      else 
        now_errors(@post)
        render :edit
      end
    end 
  end
  
  private 
  
  def post_params
    params.require(:post).permit(:title, :url, :content, :sub_id)
  end 
  
  def find_post
    @post = Post.find(params[:id])
  end 
  
end
