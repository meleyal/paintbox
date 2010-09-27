class SwatchesController < ApplicationController

  before_filter :authenticate
  
  def create 
    color = Color.find_or_create_by_value(params[:swatch][:colors][:value])    
    @swatch = current_user.swatches.build(:color_id => color.id)

    if @swatch.save
      flash[:success] = "Swatch created"
    else
      flash[:error] = color.errors.empty? ? "Error" : color.errors.full_messages.to_sentence                    
    end
    
    respond_to do |format|
      format.html { redirect_to user_path(current_user) }
      format.js   { render :partial => 'swatches/swatch', :locals => { :link => false } }
    end
    
  end

end
