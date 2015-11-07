require "readline"
require "../src/github_simple"

include GitHub::Simple

client = Client.new
client.auto_paginate = false
client.access_token = ENV["GITHUB_API_TOKEN"]

username = Readline.readline("username: ")

if username
  p client.users(username).events(public: true)
end
