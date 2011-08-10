class SwatchesController < ApplicationController

  # before_filter :authenticate

  def pick(hash, *keys)
    filtered = {}
    hash.each do |key, value| 
      filtered[key.to_sym] = value if keys.include?(key.to_sym) 
    end
    filtered
  end

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
    # Color.update_attributes pick(params, :title, :description)
    # color = Color.find_or_create_by_value(pick(params, :value))
    # debug params
    
    # swatch = Swatch.create! params
    
    
    color = Color.find_or_create_by_value(params[:swatch][:colors][:value])
    # logger.debug params
    # logger.debug pick(params, :value)
    # logger.debug "-----------------------#{params[:swatch][:colors][:value]}"
    @swatch = current_user.swatches.build(:color_id => color.id)
    @swatch.save
    render :json => @swatch
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
