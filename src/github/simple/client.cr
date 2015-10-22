require "http"
require "json"

require "./api/*"

module GitHub::Simple
  class Client
    def initialize
      @repos = {} of {String,String} => API::Repo
    end

    def get(path)
    end

    def repos(owner, repo)
      @repos[{owner, repo}] ||= API::Repo.new(self, owner, repo)
    end
  end
end
