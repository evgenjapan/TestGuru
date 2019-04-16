module ApplicationHelper
  def current_year
    DateTime.now.year
  end

  def github_url(username, repo_name)
    link_to 'Github', "https://github.com/#{username}/#{repo_name}", target: '_blank'
  end
end
