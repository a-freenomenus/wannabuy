class UsersController < ApplicationController
  before_filter :authenticate,  :only => [:index, :edit, :update, :destroy, :profile]
  before_filter :correct_user,  :only => [:edit, :update]
  before_filter :admin_user,    :only => :destroy

  def index
    @title = "Зарегистрированные пользователи"
    @users = User.paginate(:page => params[:page])
  end
  
  def new
    @user = User.new
    @title = 'Регистрация'
  end

  def show
    @user = User.find(params[:id])
    @requests = @user.requests.where('status = ?', 'started')
    @responses = @user.responses
    @title = 'Профиль пользователя ' + @user.name
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = 'Добро пожаловать!'
      redirect_to @user
    else
      @title = 'Регистрация'
      render 'new'
    end
  end

  def edit
    @title = "Редактирование профиля"
  end

  def profile
    @title = 'Мой профиль'
  end

  def requests
    @requests = current_user.requests
    @requests_group = @requests.group_by{|el| el.status}
  end

  def responses
    @responses = current_user.responses
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Профиль сохранён"
      redirect_to @user
    else
      @title = "Редактирование профиля"
      render 'edit'
    end
  end

  def destroy
    user = User.find(params[:id])
    if user != current_user
      flash[:success] = 'Пользователь удалён'
      user.destroy
    else
      flash[:notice] = 'Вы не можете удалить себя'
    end
    redirect_to users_path
  end
  
  private
  #   def authenticate
  #     deny_access unless signed_in?
  #   end
  #   
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

  #   def admin_user
  #     redirect_to(root_path) unless current_user.admin?
  #   end
  
end
