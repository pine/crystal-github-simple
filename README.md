# crystal-github-simple [![Build Status](https://travis-ci.org/pine613/crystal-github-simple.svg)](https://travis-ci.org/pine613/crystal-github-simple)

A [Crystal](http://crystal-lang.org/) wrapper for the [GitHub](https://github.com/) API.

## Installation

Add this line to your application's `shard.yml`:

```yaml
dependencies:
  github_simple:
    github: pine613/crystal-github-simple
    branch: master
```

## Usage

See example `example/commits.cr`.

```crystal
require "github_simple"

include GitHub::Simple

client = Client.new
client.auto_paginate = true
client.access_token  = "GITHUB_ACCESS_TOKEN"

p client.repos("owner", "repo").commits
p client.repos("owner", "repo").commit("sha")
```


## Contributing

1. Fork it ( https://github.com/pine613/crystal-github-simple/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## License
MIT License
