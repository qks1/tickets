# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def show_errors(errors)
    return '' if errors.size == 0
    result = "<div><h4>Ошибки:</h4><ul>"
    errors.each{|e| result << "<li>#{e}</li>" }
    result << "</ul></div>"
    return result
  end
    
end
