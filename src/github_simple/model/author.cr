require "json"

module GitHub::Simple::Model
  module Author
    class Author
			JSON.mapping({
        login: String,
        id: Int32,
        avatar_url: String,
        gravatar_id: String,
        url: String,
        html_url: String,
        followers_url: String,
        following_url: String,
        gists_url: String,
        starred_url: String,
        subscriptions_url: String,
        organizations_url: String,
        repos_url: String,
        events_url: String,
        received_events_url: String,
        type: String,
        site_admin: Bool,
      })
    end
  end
end
