class Admin::FacultiesController < ApplicationController
  before_action :set_faculty, only: [:edit, :update, :destroy]

  def index
    @caption = 'Faculties'
    @search = Faculty.search(params[:q])
    if params[:order].nil?
      @faculties = @search.result.page(params[:page]).per(20)
    else
      order = transform_params
      @faculties = @search.result.order(order).page(params[:page]).per(20)
    end      
  end

  def new
    @caption = 'New Faculty'
    @faculty = Faculty.new
  end

  def edit
    @caption = "Faculty ##{ @faculty.id }"
    @chairs = @faculty.chairs.page(params[:page]).per(20)
  end

  def create
    @faculty = Faculty.new(faculty_params)
    if @faculty.save
      flash[:note] = "New faculty was successfully created"
      redirect_to admin_faculties_path
    else
      @caption = 'New Faculty'
      render action: 'new'
    end
  end

  def update
    if @faculty.update(faculty_params)
      flash[:note] = "Faculty was successfully updated"
      redirect_to admin_faculties_path
    else
      @caption = "Faculty ##{ @faculty.id }"
      @chairs = @faculty.chairs.page(params[:page]).per(20)
      render action: 'edit'
    end
  end

  def destroy
    @faculty.destroy
    redirect_to admin_universities_path
  end

  private
    def set_faculty
      @faculty = Faculty.find(params[:id])
    end

    def faculty_params
      params.require(:faculty).permit(:name, :university_id)
    end
end
