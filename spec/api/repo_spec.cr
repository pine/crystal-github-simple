require "../spec_helper"
require "../../src/github/simple/client"
require "../../src/github/simple/api/repo"

module GitHub::Simple
  describe API::Repo do
    client = MockClient.new
    repo   = API::Repo.new(client, "owner", "repo")

    it :commits do
      client.mock_response("#")
      repo.commits
    end
  end
end
