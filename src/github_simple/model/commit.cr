require "json"

module GitHub::Simple::Model
  module Commit
    class Commit
      JSON.mapping({
        url: String,
        author: Author,
        committer: Author,
        message: String,
        tree: Tree,
        comment_count: Int32,
      })
    end

    class Author
      JSON.mapping({
        name: String,
        email: String,
        date: String,
      })
    end

    class Tree
      JSON.mapping({
        url: String,
        sha: String,
      })
    end

    class Parent
      JSON.mapping({
        url: String,
        sha: String,
      })
    end

	  class Stats
      JSON.mapping({
        additions: Int32,
        deletions: Int32,
        total: Int32,
      })
    end

    class File
      JSON.mapping({
        filename: String,
        additions: Int32,
        deletions: Int32,
        changes: Int32,
        status: String,
        raw_url: String,
        blob_url: String,
        patch: String,
      })
    end
  end
end
