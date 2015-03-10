module ApplicationHelper

  # Returns the full title on a per-page basis.
  def full_title(page_title = '')
    base_title = "X-Teams App"
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end

  def moises_deniz_aleman
    link_to "Moisés Déniz Alemán", contact_path
  end

  def show_tag(tag, i)
    "<span class=\"label label-#{XTeams::Application.getTagColor(i)} label_profile\">#{tag}</span>"
  end

  def errors_for(object)
    if object.errors.any?
      content_tag(:div, class: "panel panel-danger") do
          concat(content_tag(:div, class: "panel-heading") do
           concat(content_tag(:h4, class: "panel-title") do
             concat "#{pluralize(object.errors.count, "error")} prohibited this #{object.class.name.downcase} from being saved:"
             end)
           end)
          concat(content_tag(:div, class: "panel-body") do
             concat(content_tag(:ul) do
                      object.errors.full_messages.each do |msg|
                        concat content_tag(:li, msg)
                      end
                    end)
             end)
          end
    end
  end

end