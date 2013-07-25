class Admin::UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :destroy]

  def index
    @caption = 'Users'
    @search = User.search(params[:q])
    if params[:order].nil?
      @users = @search.result.page(params[:page]).per(20)
    else
      order = transform_params
      @users = @search.result.order(order).page(params[:page]).per(20)
    end
  end

  def new
    @caption = "New user"
    @user = User.new
  end

  def edit
    @caption = "User ##{ @user.id }"
    @microposts = @user.microposts.page(params[:micropost_page]).per(10)
    @ratings = @user.ratings.page(params[:rating_page]).per(10)
    @comments = @user.comments.page(params[:comment_page]).per(10)
  end

  def create
    @user = User.new(user_params)
    @user.chairs << @user.group.chair
    @user.email.downcase!
    if @user.save
      flash[:note] = "New user was successfully created"
      redirect_to admin_users_path
    else
      @caption = "New user"
      render action: 'new'
    end
  end

  def update
    if @user.update(user_params)
      flash[:note] = "User was successfully updated"
      redirect_to admin_users_path
    else
      @caption = "User ##{ @user.id }"
      render action: 'edit'
    end
  end

  def destroy
    @user.destroy
    redirect_to admin_users_path
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :user_type_id, :group_id)
    end
end
