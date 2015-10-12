module OpenFec
	class Financial < Client

      @@financial_endpoints = { 'committee_reports' => '/committee/{committee_id}/reports/',
                                'committee_totals' => '/committee/{committee_id}/totals/',
                                'elections' => '/elections/',
                                'reports_by_committee_type' => '/reports/{committee_type}/' }



    # def initialize
    #   @query = new_query
    # end

		def committee_reports(committee_id, options = {})
			if id_valid?(committee_id)
				return financial_request_by_committee_id(committee_id, 'committee_reports', 'committee_reports_params', options)
			end
		end

		def committee_totals(committee_id, options  = {})
			if id_valid?(committee_id)
				return financial_request_by_committee_id(committee_id, 'committee_totals', 'committee_totals_params', options)
			end
		end

		def elections(options = {})
			raise "Error: missing params for Financial.elections() method" unless hash_valid?(options)
			return financial_request('elections', 'elections_params', options)
		end

		def reports_by_committee_type(committee_type, options = {})
			if type_valid?(committee_type)
				return financial_request_by_committee_type(committee_type, 'reports_by_committee_type', 'rep_cmtee_typ_params', options)
			end
		end

		protected

   	def id_valid?(s)
   	  return true if is_valid(s)
   	  raise "Error: Failed to provide a committee_id"
   	end

   	def type_valid?(s)
   	  return true if is_valid(s)
   	  raise "Error: Failed to provide a committee_type"
   	end

    def financial_request(financial_endpoint, param_type, options = {})
    	query = default_query #{'api_key' => @@api_key }
    	query = merge_options(query, options, param_type)
      return get_financial_response( self.class.get(@@financial_endpoints[financial_endpoint], query: query))
    	#return make_request( self.class.get(@@financial_endpoints[financial_endpoint], query: query) )
    end

   	def financial_request_by_committee_id(committee_id, type, param_type, options = {})
  		query = default_query #{ 'api_key' => @@api_key }
  		query = merge_options(query, options, param_type) unless options.empty?
  		uri = @@financial_endpoints[type].sub('{committee_id}', committee_id)
      return get_financial_response(self.class.get( uri, query: query ))
  	 #return make_request( self.class.get( uri, query: query ) )
    end

   	def financial_request_by_committee_type(committee_type, type, param_type, options = {})
  		query = default_query #{ 'api_key' => @@api_key }
  		query = merge_options(query, options, param_type) unless options.empty?
  		uri = @@financial_endpoints[type].sub('{committee_type}', committee_type)
      return get_financial_response(self.class.get( uri, query: query ))
  	 #return make_request( self.class.get( uri, query: query ) )
    end

    def get_financial_response(response)
      return Financial_Response.new(response)
      #return make_request( self.class.get(@@financial_endpoints[financial_endpoint], query: query) )
    end
	end #class Financial
end #module OpenFec
