require "http"
require "json"

require "./api/*"

module GitHub::Simple
  class Client
    property :endpoint

    def initialize
      @endpoint = "https://api.github.com/"

      @repos = {} of {String,String} => API::Repo
    end

    def get(path, params = {} of String => String)
      url = "#{@endpoint}#{path}"
      url = "#{url}/#{build_query(params)}" unless params.empty?
      HTTP::Client.get(url)
    end

    def repos(owner, repo)
      @repos[{owner, repo}] ||= API::Repo.new(self, owner, repo)
    end

    private def build_query(params)
      HTTP::Params.build do |form|
        params.each {|k, v| form.add(k, v) }
      end
    end
  end
end
