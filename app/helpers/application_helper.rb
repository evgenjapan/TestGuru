module ApplicationHelper
  def current_year
    DateTime.now.year
  end

  def github_url(username, repo_name)
    "https://github.com/#{username}/#{repo_name}"
  end
end
