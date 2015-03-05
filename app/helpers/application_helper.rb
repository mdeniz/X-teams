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
    link_to "Moisés Déniz Alemán", 'http://www.moisesdeniz.com', :target => '_blank'
  end
end