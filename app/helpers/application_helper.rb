module ApplicationHelper
  def title
    base_title = 'WannaBuy'
    if @title.nil?
      base_title
    else 
      "#{base_title} | #{@title}"
    end
  end

  def breadcrumbs(*crumbs)
    capture_haml do
      haml_concat render(:partial => 'shared/breadcrumbs', :locals => {:crumbs => crumbs})
    end
  end  
  
end
