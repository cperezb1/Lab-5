class PublicationsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
  end

  def show
  end

  def new
  end

  def create
    if @publication.save
      redirect_to @publication, notice: "Publication created successfully."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @publication.update(publication_params)
      redirect_to @publication, notice: "Publication updated successfully."
    else
      render :edit
    end
  end

  def destroy
    @publication.destroy
    redirect_to publications_path, notice: "Publication deleted successfully."
  end

  private

  def publication_params
    params.require(:publication).permit(:publication_image, :description, :data_create, :user_id)
  end
end
