module GitHub::Simple::API
  class Repo
    def initialize(@client, @owner, @repo)
    end

    def commits
      @client.get("/repos/#{@owner}/#{@repo}/commits")
    end

    def commit(sha)
    end
  end
end
