require "json"

module GitHub::Simple::Response
  class Commit
    JSON.mapping({
      url:          String,
      sha:          String,
      html_url:     String,
      comments_url: String,
      commit:       Model::Commit::Commit,
      author:       {type: Model::Author::Author, nilable: true},
      committer:    {type: Model::Author::Author, nilable: true},
      parents:      Array(Model::Commit::Parent),
    })
  end

  class SingleCommit
    JSON.mapping({
      url:          String,
      sha:          String,
      html_url:     String,
      comments_url: String,
      commit:       Model::Commit::Commit,
      author:       {type: Model::Author::Author, nilable: true},
      committer:    {type: Model::Author::Author, nilable: true},
      parents:      Array(Model::Commit::Parent),
      stats:        Model::Commit::Stats,
    })
  end
end
