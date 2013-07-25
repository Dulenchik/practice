class Admin::ChairsController < ApplicationController
  before_action :set_chair, only: [:edit, :update, :destroy]

  def index
    @caption = 'Chairs'
    @search = Chair.search(params[:q])
    if params[:order].nil?
      @chairs = @search.result.page(params[:page]).per(20)
    else
      order = transform_params
      @chairs = @search.result.order(order).page(params[:page]).per(20)
    end
  end

  def new
    @caption = 'New chair'    
    @chair = Chair.new
  end

  def edit
    @caption = "Chair ##{ @chair.id }"
    @groups = @chair.groups.page(params[:page]).per(20)
    @users = @chair.users.page(params[:page]).per(20)
  end

  def create
    @chair = Chair.new(chair_params)
    if @chair.save
      flash[:note] = "New chair was successfully created"
      redirect_to admin_chairs_path
    else
      @caption = 'New chair'    
      render action: 'new'
    end
  end

  def update
    if @chair.update(chair_params)
      flash[:note] = "Chair was successfully updated"
      redirect_to admin_chairs_path
    else
      @caption = "Chair ##{ @chair.id }"
      @groups = @chair.groups.page(params[:page]).per(20)
      @users = @chair.users.page(params[:page]).per(20)
      render action: 'new'
    end
  end

  def destroy
    @chair.destroy
    redirect_to admin_chairs_path
  end

  private
    def set_chair
      @chair = Chair.find(params[:id])
    end

    def chair_params
      params.require(:chair).permit(:name, :faculty_id)
    end
end
