module OpenFec
  class Response
    attr_reader :pagination, :results

     def initialize(response)
       @request = response.request
       @headers = response.headers
     end

  end
end
