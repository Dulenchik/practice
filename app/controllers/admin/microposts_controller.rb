class Admin::MicropostsController < ApplicationController
  before_action :set_micropost, only: [:edit, :update, :destroy]

  def index
    @caption = 'Microposts'
    @search = Micropost.search(params[:q])
    if params[:order].nil?
      @microposts = @search.result.page(params[:page]).per(20)
    else
      order = transform_params
      @microposts = @search.result.order(order).page(params[:page]).per(20)
    end
  end

  def new
    @caption = 'New micropost'
    @micropost = Micropost.new
  end

  def edit
    @caption = "Micropost ##{ @micropost.id }"
    @ratings = @micropost.ratings.page(params[:page]).per(20)
    @comments = @micropost.comments.page(params[:page]).per(20)
  end

  def create
    @micropost = Micropost.new(micropost_params)
    if @micropost.save
      flash[:note] = "New micropost was successfully created"
      redirect_to admin_microposts_path
    else
      @caption = 'New micropost'
      render action: 'new'
    end
  end

  def update
    if @micropost.update(micropost_params)
      flash[:note] = "Micropost was successfully updated"
      redirect_to admin_microposts_path
    else
      @caption = "Micropost ##{ @micropost.id }"
      @ratings = @micropost.ratings.page(params[:page]).per(20)
      @comments = @micropost.comments.page(params[:page]).per(20)
      render action: 'edit'
    end
  end

  def destroy
    @micropost.destroy
    redirect_to admin_microposts_path
  end

  private
    def set_micropost
      @micropost = Micropost.find(params[:id])
    end

    def micropost_params
      params.require(:micropost).permit(:content, :user_id)
    end
end
