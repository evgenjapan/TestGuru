module ApplicationHelper
  def current_year
    DateTime.now.year
  end

  def github_url(username, repo_name)
    link_to 'Github', "https://github.com/#{username}/#{repo_name}", target: '_blank'
  end

  def flash_message
    flash.map do |key, msg|
      content_tag :div, msg.html_safe, :class => "alert alert-#{key}", :role => 'alert'
    end.join.html_safe
  end
end
