class Admin::UniversitiesController < ApplicationController
  before_action :set_university, only: [:edit, :update, :destroy]

  def index
    @caption = 'Universities'
    @search = University.search(params[:q])
    if params[:order].nil?
      @universities = @search.result.page(params[:page]).per(20)
    else
      order = transform_params
      @universities = @search.result.order(order).page(params[:page]).per(20)
    end
  end

  def new
    @caption = 'New university'
    @university = University.new
  end

  def edit
    @caption = "University ##{ @university.id }"
    @faculties = @university.faculties.page(params[:page]).per(20)
  end

  def create
    @university = University.new(university_params)
    if @university.save
      flash[:note] = "New university was successfully created"
      redirect_to admin_universities_path
    else
      @caption = 'New university'
      render action: 'new'
    end
  end

  def update
    if @university.update(university_params)
      flash[:note] = "University was successfully updated"
      redirect_to admin_universities_path
    else
      @caption = "University ##{ @university.id }"
      @faculties = @university.faculties.page(params[:page]).per(20)
      render action: 'edit'
    end
  end

  def destroy
    @university.destroy
    redirect_to admin_universities_path
  end

  private
    def set_university
      @university = University.find(params[:id])
    end

    def university_params
      params.require(:university).permit(:name, :address)
    end
end
