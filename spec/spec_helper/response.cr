module GitHub::Simple
  class MockResponse
    property :body

    def initialize(@body = "")
    end
  end
end
