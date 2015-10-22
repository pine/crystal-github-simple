require "./spec_helper"
require "../src/github/simple/version"

describe GitHub::Simple do
  it :VERSION do
    GitHub::Simple::VERSION.should be_a(String)
  end
end
