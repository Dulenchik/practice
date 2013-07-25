module ApplicationHelper
  def current_or_link(name)
    params[:controller] == "admin/#{ name }" ? 'current' : 'link'
  end
  
  def order_by(arg)
    params[:order] == "#{ arg }_asc" ? "#{ arg }_desc" : "#{ arg }_asc"
  end

  def errors_for(arg)
    if arg.errors.any?
      result = "<div id='errors'>#{ pluralize(arg.errors.count, 'error') }:<ul>"
      arg.errors.full_messages.each { |msg| result += "<li>#{ msg }</li>" }
      result += "</ul></div>"
    end
    result.html_safe unless result.nil?
  end

  def short_version(arg)
    if arg.length > 100
      arg.slice!(0, 97).concat!('...')
    end
    arg
  end

  def unsuccesfully_search(arg, path)    
    if params[:commit] == 'Search'
      %{<div id='message'>#{ arg.capitalize } not found, 
        <a href='#{ path }' >show all #{ arg.downcase }</a></div> }.html_safe
    end
  end
end
