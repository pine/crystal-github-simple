require "http"
require "json"

require "./model/*"
require "./response/*"
require "./resource/*"

module GitHub::Simple
  class Client
    property :endpoint
    property :auto_paginate

    def initialize
      @headers = HTTP::Headers { "Accept": "application/vnd.github.v3+json" }
      @endpoint = "https://api.github.com/"
      @auto_paginate = false

      @repos = {} of {String,String} => Resource::Repo
    end

    def get(path, params = {} of String => String)
      query = build_query(params)
      url = "#{@endpoint}#{path}"
      url = "#{url}/#{query}" unless params.empty?
      [ HTTP::Client.get(url, @headers) ]
    end

    def repos(owner, repo)
      @repos[{owner, repo}] ||= Resource::Repo.new(self, owner, repo)
    end

    private def build_query(params)
      HTTP::Params.build do |form|
        params.each {|k, v| form.add(k, v) }
      end
    end
  end
end
