class PagesController < ApplicationController

  def home
    @swatches = Swatch.recent.includes(:user, :color)
  end

  def about
    @title = "about"
  end

end
