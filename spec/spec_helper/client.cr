require "./response"

module GitHub::Simple
  class MockClient

    def initialize(@mock_response)
    end

    def get(path, cursor = nil, params = {} of String => String)
      [ @mock_response ]
    end
  end
end
