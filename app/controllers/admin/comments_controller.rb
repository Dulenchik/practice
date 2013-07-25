class Admin::CommentsController < ApplicationController
  before_action :set_comment, only: [:edit, :update, :destroy]

  def index
    @caption = 'Comments'
    @search = Comment.search(params[:q])
    if params[:order].nil?
      @comments = @search.result.page(params[:page]).per(20)
    else
      order = transform_params
      @comments = @search.result.order(order).page(params[:page]).per(20)
    end
  end

  def new
    @caption = 'New comment'
    @comment = Comment.new
  end

  def edit
    @caption = "Comment ##{ @comment.id }"
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save 
      flash[:note] = "New comment was successfully created"
      redirect_to admin_comments_path
    else
      @caption = 'New comment'
      render action: 'new'
    end
  end

  def update
    if @comment.update(comment_params)
      flash[:note] = "Comment was successfully updated"
      redirect_to admin_comments_path
    else
      @caption = "Comment ##{ @comment.id }"
      render action: 'edit'
    end
  end

  def destroy
    @comment.destroy
    redirect_to admin_comments_path
  end

  private
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:text, :user_id, :micropost_id)
    end
end
