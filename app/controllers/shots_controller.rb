class ShotsController < ApplicationController
  before_action :set_shot, only: [:show, :edit, :update, :destroy, :like, :unlike]
  before_action :authenticate_user!, only: [:edit, :update, :destroy, :like, :unlike]
  impressionist actions: [:show], unique: [:impressionable_type, :impressionable_id, :session_hash]

  respond_to :html, :json

  def index
    @shots = Shot.all.order('created_at DESC')
    respond_with(@shots)
  end

  def show
    respond_with(@shot)
  end

  def new
    @shot = current_user.shots.build
    respond_with(@shot)
  end

  def edit
  end

  def create
    @shot = current_user.shots.build(shot_params)
    # for HTML response
    @shot.save
    respond_with(@shot)
    # for more generic response (HTML, JSON)
    # respond_to do |format|
    #   if @shot.save
    #     format.html { redirect_to @shot, notice: 'Shot was successfully created.' }
    #     format.json { render :show, status: :created, location: @shot }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @shot.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  def update
    # for HTML response
    @shot.update(shot_params)
    respond_with(@shot)

    # for more generic response (HTML, JSON)
    # respond_to do |format|
    #   if @shot.update(shot_params)
    #     format.html { redirect_to @shot, notice: 'Shot was successfully updated.' }
    #     format.json { render :show, status: :ok, location: @shot }
    #   else
    #     format.html { render :edit }
    #     format.json { render json: @shot.errors, status: :unprocessable_entity }
    #   end
    # end

  end

  # DELETE /shots/1
  # DELETE /shots/1.json # for JSON response
  def destroy
    @shot.destroy
    # for HTML response
    respond_with(@shot)
    # for more generic response (HTML, JSON)
    # respond_to do |format|
    #     format.html { redirect_to shots_url, notice: 'Shot was successfully destroyed.' }
    #     format.json { head :no_content }
    # end
  end

  def like
    @shot.liked_by current_user
    respond_to do |format|
          format.html { redirect_to :back } # rails v4
          # format.html { redirect_back fallback_location: root_path } # rails v5
          format.json { render layout:false }
    end
  end

  def unlike
    @shot.unliked_by current_user
    respond_to do |format|
          format.html { redirect_to :back } # rails v4
          # format.html { redirect_back fallback_location: root_path } # rails v5
          format.json { render layout:false }
    end
  end

  private
    def set_shot
      @shot = Shot.find(params[:id])
    end

    def shot_params
      params.require(:shot).permit(:title, :description, :user_id)
    end

end
