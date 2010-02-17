# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def link_to_remove_fields(name, f)
    f.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)")
  end

  def link_to_add_fields(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s.singularize + "_fields", :f => builder)
    end
    link_to_function(name, h("add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")"))
  end

  def icon_url(args)
    icon = args[:icon]
    url = args[:url]
    text = args[:text]
    id = args[:id]
    js_url = args[:js_url]

    span = "<span class=\"icon_link\""
    if id
      span << " id=\"#{id}\""
    end
    span << ">"

    if url
      link = "<a href=\"#{url}\" title=\"#{text}\">"
    else
      link = "<a href=\"#\" onclick=\"javascript:#{js_url} return false;\" alt=\"#{text}\">"
    end

    img = "<img src=\"/images/#{icon}.png\" alt=\"#{text}\" class=\"icon\" />"
    
    "#{span}#{link}#{img}</a>#{link}#{text}</a></span>"
  end
  
  def button_url(args)
    icon = args[:icon]
    url = args[:url]
    text = args[:text]
    id = args[:id]
    js_url = args[:js_url]

    span = "<span class=\"button_link\""
    if id
      span << " id=\"#{id}\""
    end
    span << ">"

    if url
      link = "<a href=\"#{url}\" title=\"#{text}\">"
    else
      link = "<a href=\"#\" onclick=\"javascript:#{js_url} return false;\" alt=\"#{text}\">"
    end

    img = "<img src=\"/images/#{icon}.png\" alt=\"#{text}\" class=\"icon\" />"
    
    "#{span}#{link}#{img}</a>#{link}#{text}</a></span>"
  end
end
