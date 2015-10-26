module GitHub::Simple::API
  class Repo
    def initialize(@client, @owner, @repo)
    end

    def commits(params = {} of String => String)
      @client.get("/repos/#{@owner}/#{@repo}/commits", params)
    end

    def commit(sha)
    end
  end
end
