class SubsController < ApplicationController
  before_action :require_login, only: [:new, :create, :edit, :update]
  before_action :find_sub, only: [:update, :show, :edit]
  
  def new
    @sub = Sub.new
    render :new
  end

  def create
    @sub = Sub.new(sub_params)
    @sub.moderator_id = params[:user_id]
    
    if @sub.save
      redirect_to sub_url(@sub)
    else
      now_errors(@sub)
      render :new
    end
  end

  def edit
    render :edit
  end

  def update
    if @sub.update(sub_params)
      redirect_to sub_url(@sub)
    else 
      now_errors(@sub)
      render :edit
    end 
  end

  def show
    render :show
  end

  def index
    @subs = Sub.all
    render :index
  end
  
  private
  
  def sub_params
    params.require(:sub).permit(:title, :description)
  end
  
  def find_sub
    @sub = Sub.find(params[:id])
  end
end
