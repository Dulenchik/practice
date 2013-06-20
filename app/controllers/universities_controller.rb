class UniversitiesController < ApplicationController
  before_action :set_university, only: [:edit, :update, :destroy]

  def index
    @universities = University.all
  end

  def new
    @university = University.new
  end

  def edit
  end

  def create
    @university = University.new(university_params)
    if @university.save
      redirect_to universities_path
    else
      render action: 'new'
    end
  end

  def update
    if @university.update(university_params)
      redirect_to universities_path
    else
      render action: 'new'
    end
  end

  def destroy
    @university.destroy
    redirect_to universities_path
  end

  private
    def set_university
      @university = University.find(params[:id])
    end

    def university_params
      params.require(:university).permit(:name, :address)
    end
end
