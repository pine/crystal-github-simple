module GitHub::Simple::Resource
  class User
    property :username

    def initialize(@client, @username)
    end

    def events(public = false, org = nil)
      path = if public
               "/users/#{@username}/events/public"
             elsif org
               "/users/#{@username}/events/orgs/#{org}"
             else
               "/users/#{@username}/events"
             end

      @client.get(path).map { |response|
        Array(Response::Event).from_json(response.body)
      }.flatten
    end
  end
end
