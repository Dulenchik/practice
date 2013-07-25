class Admin::UserTypesController < ApplicationController
  before_action :set_user_type, only: [:edit, :update, :destroy]

  def index
    @caption = 'Types of users'
    @search = UserType.search(params[:q])
    @user_types = @search.result.page(params[:page]).per(20)
  end

  def new
    @caption = "New user's type"
    @user_type = UserType.new
  end

  def edit
    @caption = "User's type ##{ @user_type.id }"
    @users = @user_type.users.page(params[:page]).per(20)
  end

  def create
    @user_type = UserType.new(user_type_params)
    if @user_type.save
      flash[:note] = "New user's type was successfully created"
      redirect_to admin_user_types_path
    else
      @caption = "New user's type"
      render action: 'new'
    end
  end

  def update
    if @user_type.update(user_type_params)
      flash[:note] = "User's type was successfully updated"
      redirect_to admin_user_types_path
    else
      @caption = "User's type ##{ @user_type.id }"
      @users = @user_type.users.page(params[:page]).per(20)
      render action: 'edit'
    end
  end

  def destroy
    @user_type.destroy
    redirect_to admin_user_types_path
  end

  private
    def set_user_type
      @user_type = UserType.find(params[:id])
    end

    def user_type_params
      params.require(:user_type).permit(:name)
    end
end
