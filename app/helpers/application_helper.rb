module ApplicationHelper
  
  # Return a title on a per-page basis.
  def title
    base_title = "Hellish people"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
  
  def current_page(action,link)
    'class="current_page_item"'.html_safe if action == link
  end
end
