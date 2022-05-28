module ApplicationHelper

  BASE_TITLE = "BIGBAG Store".freeze

  def full_title(page_title)
    if page_title.blank?  #toppageなどpage_titleが空,nilの対策
      BASE_TITLE
    else
      "#{page_title.upcase} - #{BASE_TITLE}"
    end
  end

end
