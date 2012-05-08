module ApplicationHelper
  def alternate_class(count, include_class_text = true)
    value = ( count % 2 == 0 ? 'even' : 'odd' )
    
    if include_class_text
      'class="' << value << '"'
    else
      value
    end
  end
end