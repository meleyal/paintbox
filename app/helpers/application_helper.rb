module ApplicationHelper
  
  #
  # HTML helpers
  #

  def page_title
    unless @title.nil?
      "/ #{@title}"
    end
  end
  
  def txt(text)
    raw textilize text
  end
  
  # def linked_title
  #   base_title = "paintbox"
  #   if @title.nil?
  #     link_to root_path, base_title
  #   else
  #     # "<a href='#{root_path}'>#{base_title}</a> / #{@title}"
  #     link_to root_path, base_title " / fark"
  #   end
  # end
  
  

    
end
