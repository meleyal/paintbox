class SwatchesController < ApplicationController

  # before_filter :authenticate

  def index
    @user = User.find_by_identifier(params[:user_id])

    if @user.nil?
      @swatches = Swatch.all.to_json(:order => 'created_at DESC', :include => :color)
    else
      @swatches = @user.swatches.all.to_json(:order => 'created_at DESC', :include => :color)
    end

    render :json => @swatches
 
  end
  
  def show
    render :json => Swatch.find(params[:id])
  end
  
  def create
    swatch = Swatch.create! params
    render :json => swatch
  end
  
  def update
    swatch = Swatch.find(params[:id])
    swatch.update_attributes! params
    render :json => swatch
  end

  
  # def create 
  #   color = Color.find_or_create_by_value(params[:swatch][:colors][:value])    
  #   @swatch = current_user.swatches.build(:color_id => color.id)
  # 
  #   if @swatch.save
  #     flash[:success] = "Saved"
  #   else
  #     flash[:error] = color.errors.empty? ? "Error" : color.errors.full_messages.to_sentence                    
  #   end
  #   
  #   respond_to do |format|
  #     format.html { redirect_to user_path(current_user) }
  #     format.js   { render :partial => 'swatches/swatch', :locals => { :link => false } }
  #   end
  #   
  # end

end
