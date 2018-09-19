class CommentsController < ApplicationController
  before_action :require_login
  def new
    @comment = Comment.new
    render :new
  end

  def create
    @comment = Comment.new(comment_params)
    
    if @comment.save
      
    else
      now_errors(@comment)
      render :new
    end
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:content)
  end
end
