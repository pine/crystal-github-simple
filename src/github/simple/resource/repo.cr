module GitHub::Simple::Resource
  class Repo
    def initialize(@client, @owner, @repo)
    end

    def commits(params = {} of String => String)
      @client.get("/repos/#{@owner}/#{@repo}/commits", params).map {|response|
        Array(Response::Commit).from_json(response.body)
      }.flatten
    end

    def commit(sha)
      @client.get("/repos/#{@owner}/#{@repo}/commits/#{sha}").map {|response|
        Response::SingleCommit.from_json(response.body)
      }.first
    end
  end
end
