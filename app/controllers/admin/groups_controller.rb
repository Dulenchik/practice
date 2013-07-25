class Admin::GroupsController < ApplicationController
  before_action :set_group, only: [:edit, :update, :destroy]

  def index
    @caption = 'Groups'
    @search = Group.search(params[:q])
    if params[:order].nil?
      @groups = @search.result.page(params[:page]).per(20)
    else
      order = transform_params
      @groups = @search.result.order(order).page(params[:page]).per(20)
    end
  end

  def new
    @caption = 'New group'    
    @group = Group.new
  end

  def edit
    @caption = "Group ##{ @group.id }"
    @users = @group.users.page(params[:page]).per(20)
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      flash[:note] = "New group was successfully created"
      redirect_to admin_groups_path
    else
      @caption = 'New group' 
      render action: 'new'
    end
  end

  def update
    if @group.update(group_params)
      flash[:note] = "Group was successfully updated"
      redirect_to admin_groups_path
    else
      @caption = "Group ##{ @group.id }"
      @users = @group.users.page(params[:page]).per(20)
      render action: 'edit'
    end
  end

  def destroy
    @group.destroy
    redirect_to admin_groups_path
  end

  private
    def set_group
      @group = Group.find(params[:id])
    end

    def group_params
      params.require(:group).permit(:name, :chair_id)
    end
end
