require "./spec_helper"
require "../src/github/simple/client"

describe GitHub::Simple::Client do
  client = GitHub::Simple::Client.new

  it :get do
    WebMock.wrap do
      WebMock.stub(:get, "api.github.com/repos/pine613/crenv/commits")
      res = client.get("repos/pine613/crenv/commits").first

      res.status_code.should eq(200)
      res.body.should eq("")
    end
  end

  it :repos do
    client.repos("owner", "repo").should be_a(GitHub::Simple::Resource::Repo)
  end

end
