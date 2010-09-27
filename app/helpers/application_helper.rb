# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def title(page_title)
    content_for(:title) { "/ #{page_title}" }
  end
  
  # def app_name
  #   'paintbox'
  # end

  # def title
  #   base_title = "paintbox"
  #   if @title.nil?
  #     link_to("base_title", "root_path")
  #   else
  #     # "#{base_title} / #{h(@title)}" # escape output
  #     link_to(base_title, root_path)
  #   end
  # end

  # def page_title(text)
  #   "#{app_name} / #{text}"
  #   # content_for(:title) { page_title }
  #   # @content_for_title
  # end
  # 
  # def page_heading(text)
  #   "#{app_name} / #{text}"    
  # end
  
end
