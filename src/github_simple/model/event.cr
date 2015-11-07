require "json"

module GitHub::Simple::Model
  module Event
    class Repo
      JSON.mapping({
        id:   Int32,
        name: String,
        url:  String,
      })
    end

    class Actor
      JSON.mapping({
        id:          Int32,
        login:       String,
        gravatar_id: String,
        avatar_url:  String,
        url:         String,
      })
    end

    class Org
      JSON.mapping({
        id:          Int32,
        login:       String,
        gravatar_id: String,
        url:         String,
        avatar_url:  String,
      })
    end
  end
end
