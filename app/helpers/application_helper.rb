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

  def show_tag(power, i)
    "<span class=\"label label-#{XTeams::Application.getTagColor(i)}\">#{power}</span>"
  end
end