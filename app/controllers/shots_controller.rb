class ShotsController < ApplicationController
  before_action :set_shot, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @shots = Shot.all
    respond_with(@shots)
  end

  def show
    respond_with(@shot)
  end

  def new
    @shot = Shot.new
    respond_with(@shot)
  end

  def edit
  end

  def create
    @shot = Shot.new(shot_params)
    @shot.save
    respond_with(@shot)
  end

  def update
    @shot.update(shot_params)
    respond_with(@shot)
  end

  def destroy
    @shot.destroy
    respond_with(@shot)
  end

  private
    def set_shot
      @shot = Shot.find(params[:id])
    end

    def shot_params
      params.require(:shot).permit(:title, :description, :user_id)
    end
end
