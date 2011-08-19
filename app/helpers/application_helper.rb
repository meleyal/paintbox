module ApplicationHelper

  def page_title
    unless @title.nil?
      "/ #{@title}"
    end
  end
 
end