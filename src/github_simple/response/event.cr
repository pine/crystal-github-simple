require "json"

module GitHub::Simple
  module Response
    class Event
      JSON.mapping({
        type: String,
        public: Bool,
        repo: Model::Event::Repo,
        actor: Model::Event::Actor,
        org: { type: Model::Event::Org, nilable: true },
        created_at: String,
        id: String,
      })
    end
  end
end
