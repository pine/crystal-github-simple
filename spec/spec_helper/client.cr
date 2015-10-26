module GitHub::Simple
  class MockClient
    def initialize
      @mock_response = ""
    end

    def mock_response(json)
    end

    def get(path, params = {} of String => String)
      @mock_response
    end
  end
end
