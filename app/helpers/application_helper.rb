module ApplicationHelper

  def page_title(title)
    content_for(:page_title) { "/ #{title}" }
  end

  def page_id(page_id)
    content_for(:page_id) { page_id }
  end

end