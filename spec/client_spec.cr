require "./spec_helper"
require "../src/github/simple/client"

describe GitHub::Simple::Client do
  client = GitHub::Simple::Client.new

  it :repos do
    client.repos("owner", "repo").should be_a(GitHub::Simple::API::Repo)
  end
end
