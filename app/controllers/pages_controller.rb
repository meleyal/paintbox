class PagesController < ApplicationController

  def home
    @swatches = Swatch.all(:limit => 500, :order => 'created_at DESC', :include => [:user, :color])
    # @swatches = Swatch.all()
  end

  def about
    @title = "about"
  end

end
