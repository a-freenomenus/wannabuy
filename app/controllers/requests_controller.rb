class RequestsController < ApplicationController
  before_filter :authenticate,  :only => [:new, :edit, :create, :update]

  def new
    @request = Request.new
  end

  def create
    @request  = current_user.requests.build(params[:request])
    if @request.save
      flash[:success] = "Ваш запрос создан!"
      redirect_to request_path(@request)
    else
      render 'new'
    end    
  end

  def show
    @request = Request.find(params[:id])
  end
end
