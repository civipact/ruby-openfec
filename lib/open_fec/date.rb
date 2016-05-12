module OpenFec
  class Date < Client

    def self.calendar_dates(options = {})
      return date_request('calendar_dates', 'cal_dates_req_params', options) 
    end

    def self.election_dates(options = {})
      return date_request('election_dates', 'elec_dates_req_params', options) 
    end

    def self.reporting_dates(options = {})
      return date_request('reporting_dates', 'rep_dates_req_params', options) 
    end




    protected

    def self.date_request(date_endpoint, param_type, options = {})
      query = {'api_key' => @@api_key }
      query = merge_options(query, options, param_type)
      return get_date_response( self.get(@@date_endpoints[date_endpoint], query: query))
    end

    def self.get_date_response(response)
      return Date_Response.new(response)
    end
    

      end #class Financial
end #module OpenFec
