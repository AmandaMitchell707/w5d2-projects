class SubsController < ApplicationController
  before_action :require_login
  before_action :find_sub, only: [:update, :show, :edit]
  
  def new
    @sub = Sub.new
    render :new
  end

  def create
    @sub = Sub.new(sub_params)
    
    if @sub.save
      redirect_to sub_url(@sub)
    else
      now_errors(@sub)
      render :new
    end
  end

  def edit
  end

  def update
  end

  def show
  end

  def index
  end
  
  private
  def sub_params
    params.require(:sub).permit(:title, :description)
  end
  
  def find_sub
    @sub = Sub.find(params[:id])
  end
end
