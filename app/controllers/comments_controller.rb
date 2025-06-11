class CommentsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index; end
  def show; end

  def new; end

  def create
    if @comment.save
      redirect_to @comment, notice: "Comment created successfully."
    else
      render :new
    end
  end

  def edit; end

  def update
    if @comment.update(comment_params)
      redirect_to @comment, notice: "Comment updated successfully."
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
    redirect_to comments_path, notice: "Comment deleted successfully."
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :date_create, :actualization_date, :user_id, :publication_id)
  end
end
