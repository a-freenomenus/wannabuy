class RequestsController < ApplicationController
  before_filter :authenticate,  :only => [:new, :edit, :create, :update]
  before_filter :correct_user,  :only => [:edit, :update, :destroy]

  def index
    @title = 'Открытые запросы'
    @requests = Request.where('status = ?', 'started').paginate(:page => params[:page])
  end

  def new
    @request = Request.new
    @request.criterions.build.values.build
  end
  
  def edit
    @title = "Редактирование запроса"
    @request = Request.find(params[:id])
  end

  def create
    @request  = current_user.requests.new(params[:request])

    if @request.save
      flash[:success] = "Ваш запрос создан!"
      redirect_to request_path(@request)
    else
      render 'new'
    end    
  end

  def update
    @request = Request.find(params[:id])
    if @request.update_attributes(params[:request])
      flash[:success] = 'Запрос сохранён'
      redirect_to @request
    else
      @title = "Редактирование запроса"
      render 'edit'
    end
  end

  def destroy
    @request = Request.find(params[:id])
    @request.destroy
    flash[:success] = 'Запрос удалён'
    redirect_to requests_path
  end

  def show
    @request = Request.find(params[:id])
    @title = @request.name
    @response = @request.responses.new(:request_id => params[:id])
    @comment  = @request.comments.new(:request_id  => params[:id])
  end

  private
    def correct_user
      @user = Request.find(params[:id]).user
      unless current_user?(@user) || current_user.admin?
        flash[:error] = 'У вас нет прав на совершение данного действия'
        redirect_to(root_path)     
      end
    end
end
