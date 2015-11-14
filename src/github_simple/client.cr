require "http"
require "json"
require "rfc5988"

require "./model/*"
require "./response/*"
require "./resource/*"

module GitHub::Simple
  class Client
    property :endpoint
    property :auto_paginate

    def initialize(
                   access_token = nil,
                   @endpoint = "https://api.github.com",
                   @auto_paginate = false)
      @headers = HTTP::Headers{"Accept": "application/vnd.github.v3+json"}
      @repos = {} of {String, String} => Resource::Repo
      @users = {} of String           => Resource::User

      self.access_token = access_token
    end

    def access_token
      @access_token
    end

    def access_token=(token : String?)
      @access_token = token

      if token.is_a? String
        @headers["Authorization"] = "token #{token}"
      else
        @headers.delete("Authorization")
      end
    end

    def get(path, params = {} of String => String)
      query = build_query(params)
      url = "#{@endpoint}#{path}"
      url = "#{url}#{query}" unless params.empty?

      responses = [HTTP::Client.get(url, @headers)]

      while @auto_paginate
        headers = responses.last.headers
        next_url = parse_next_header(headers)
        break unless next_url

        responses.push(HTTP::Client.get(next_url, @headers))
      end

      responses
    end

    def repos(owner, repo)
      @repos[{owner, repo}] ||= Resource::Repo.new(self, owner, repo)
    end

    def users(username)
      @users[username] ||= Resource::User.new(self, username)
    end

    private def build_query(params)
      HTTP::Params.build do |form|
        params.each { |k, v| form.add(k, v) }
      end
    end

    private def parse_next_header(headers)
      if link_header = headers["Link"]?
        values = RFC5988.parse(link_header)
        if next_header = values.find { |value| value.rel == "next" }
          next_header.url
        end
      end
    end
  end
end
