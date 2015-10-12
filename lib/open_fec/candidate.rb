module OpenFec
	class Candidate < Client

  	### Methods: 'merge_options', 'make_request' are found in parent Client class

	    def all
	     candidate_request('all')
	    end

	    def all_sort_by(field)
	    	#SORT HERE
	    end

	    def all_where(options = {})
	  		candidate_request('all', options)
	    end

	    def by_name(name)
	    	raise "Failed to provide valid name for by_name search" unless is_valid(name)
	    	candidate_request('by_name', { 'name' => name.to_s })
	    end

	    def history(candidate_id, options = {})
	    	return request_by_candidate_id(candidate_id, 'history', options) if id_valid?(candidate_id)
	    end

	    def committees(candidate_id, options = {})
	    	return request_by_candidate_id(candidate_id, 'committees', options) if id_valid?(candidate_id)
	    end

	    def committee_history(candidate_id, options = {})
	    	return request_by_candidate_id(candidate_id, 'committee_history', options) if id_valid?(candidate_id)
	    end

	    def communication_costs(candidate_id, options = {})
	    	if id_valid?(candidate_id)
	    		query = { 'candidate_id' => candidate_id }
		    	query = merge_options(query, options) if hash_valid?(options)
		    	return request_by_candidate_id(candidate_id, 'communication_costs', query)
		    end
	    end

	    def electioneering_costs(candidate_id, options = {})
	    	if id_valid?(candidate_id)
	    		query = { 'candidate_id' => candidate_id }
	    		query = merge_options(query, options, 'candidate_req_params') if hash_valid?(options)
	    		return request_by_candidate_id(candidate_id, 'electioneering_costs', query)
	    	end
	    end

	    def history_by_cycle(candidate_id, cycle)
	    	raise "Parameter(s) missing for history_by_cycle" unless is_valid(candidate_id) && is_valid(cycle)
	    	return get_candidate_response( self.class.get("/candidate/#{candidate_id}/history/#{cycle}/", query: {'api_key' => @@api_key } ))
	    end

	    #########
	    protected

	   	def id_valid?(s)
   		  return true if is_valid(s)
   		  raise "Error: Failed to provide valid candidate_id"
	   	end

	    def candidate_request(type, options = {})
	    	query = {'api_key' => @@api_key }
	    	query = merge_options(query, options, 'candidate_req_params')
	    	return get_candidate_response( self.class.get(@@candidate_endpoints[type], query: query) )
	    end

	   	def request_by_candidate_id(candidate_id, type, options = {})
	   		query = { 'api_key' => @@api_key }
	   		query = merge_options( { 'api_key' => @@api_key }, options, 'candidate_req_params') if hash_valid?(options)
    		uri = @@candidate_endpoints[type].sub('{candidate_id}', candidate_id)
    		return get_candidate_response( self.class.get( uri, query: query ))
	    end

	    def get_candidate_response(response)
	    	return Candidate_Response.new(response)
	    end

	end #class Candidate
end #module Sunlight
