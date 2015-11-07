require "readline"
require "../src/github_simple"

include GitHub::Simple

client = Client.new
client.auto_paginate = false
client.access_token = ENV["GITHUB_API_TOKEN"]

owner = Readline.readline("owner: ")
repo = Readline.readline("repo : ")

if owner && repo
  p client.repos(owner, repo).commits
end
