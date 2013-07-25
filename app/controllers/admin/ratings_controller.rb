class Admin::RatingsController < ApplicationController
  before_action :set_rating, only: [:edit, :update, :destroy]

  def index
    @caption = 'Ratings'
    @search = Rating.search(params[:q])
    if params[:order].nil?
      @ratings = @search.result.page(params[:page]).per(20)
    else
      order = transform_params
      @ratings = @search.result.order(order).page(params[:page]).per(20)
    end
  end

  def new
    @caption = 'New rating'
    @rating = Rating.new
  end

  def edit
    @caption = "Rating ##{ @rating.id }"
  end

  def create
    @rating = Rating.new(rating_params)
    if @rating.save
      flash[:note] = "New rating was successfully created"
      redirect_to admin_ratings_path
    else
      @caption = 'New rating'
      render action: 'new'
    end
  end

  def update
    if @rating.update(rating_params)
      flash[:note] = "Rating was successfully updated"
      redirect_to admin_ratings_path
    else
      @caption = "Rating ##{ @rating.id }"
      render action: 'edit'
    end
  end

  def destroy
    @rating.destroy
    redirect_to admin_ratings_path
  end

  private
    def set_rating
      @rating = Rating.find(params[:id])
    end

    def rating_params
      params.require(:rating).permit(:value, :user_id, :micropost_id)
    end
end
