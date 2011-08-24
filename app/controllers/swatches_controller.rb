class SwatchesController < ApplicationController

  # before_filter :authenticate
  # before_filter :get_parent

  def index
    @user = User.find_by_username(params[:user_id])
    @swatches = @user.nil? ? Swatch.recent : @user.swatches
    respond_to do |format|
      format.html
      format.json { render json: @swatches.to_json(:include => :color) }
    end
  end
  
  def create    
    # swatch = Swatch.create! params
    color = Color.find_or_create_by_value(params[:swatch][:colors][:value])
    @swatch = current_user.swatches.build(:color_id => color.id)
    @swatch.save
    render :json => @swatch
  end
  
  def update
    swatch = Swatch.find(params[:id])
    swatch.update_attributes! params
    render :json => swatch
  end

private

  # def get_parent
  #   @user ||= User.find_by_username(params[:user_id])
  # end

end