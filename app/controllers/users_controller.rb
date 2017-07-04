class UsersController < ApplicationController
  before_action :require_user, only: [:show, :edit, :destroy]
  def index
    @users = User.paginate(:page => params[:page], :per_page => 5)
  end
  def new
    @user = User.new
  end
  def show
    @user = User.find(params[:id])
    @user_articles = @user.articles.order("updated_at DESC").paginate(:page => params[:page], :per_page => 5)
  end

  def create
    #  render plain: params[:article].inspect
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Success"
      redirect_to user_path(@user)
    else
      render "new"
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "Your page was updated"
      redirect_to user_path(@user)
    else
      render "edit"
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end
