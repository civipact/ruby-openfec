

module OpenFecApi
	class Candidate < Client

	    # def initialize(params)
	    #   params.each do |key, value|
	    #     value = Time.parse(value) if key == "birthdate" && value && value.size > 0
	    #     instance_variable_set("@#{key}", value) if Legislator.instance_methods.map { |m| m.to_sym }.include? key.to_sym
	    #   end
	    # end #initialize


		# def initialize(options = {})
	 #      #query = {'api_key' => @api_key}
	 #      request_params = ["sort", "sort_hide_null", "year", "office", "candidate_status", "party", "state", "cycle", "district", "incumbent_challenge", "name", "candidate_id", "page", "per_page"]
	 #      request_options = options.select{|key, value| request_params.include?(key.to_s)}
	 #      request_options.each do |key, value|
	 #        query.merge!({key.to_s => value})
	 #      end
	 #      response = self.class.get("/candidates", query: query)
	 #      return Response.new(response)
	 #    end #initialize


	    def self.all
	    	#Will append '/candidates/' to base uri
	    	query = {'api_key' => @@api_key }
	        response = self.get("/candidates", query: query)
	        return Response.new(response)
	    	
	    end #all

	    def self.all_sort_by(field)
	    	#Will append '/candidates/' to base uri
	    	#and sort on the field passed in by 'field' parameter
	    	request_params = ["sort", "sort_hide_null", "year", "office", "candidate_status", "party", "state", "cycle", "district", "incumbent_challenge", "name", "candidate_id", "page", "per_page"]

	    end #all_sort_by


	    def self.all_where(options)
	    	#will append /candidates/ to base uri and accept hash of options
	    	query = {'api_key' => @@api_key }
	    	valid_params = ["sort", "sort_hide_null", "year", "office", "candidate_status", "party", "state", "cycle", "district", "incumbent_challenge", "name", "candidate_id", "page", "per_page"]
	    	request_params = options.select{|key, value| valid_params.include?(key.to_s)}

	   		request_params.each do |key, value|
	          query.merge!({key.to_s => value})
	        end

	        response = self.get("/candidates", query: query)
	        return Response.new(response)
	    end #all_where




	    def self.by_name
	    	
	    end #by_name


	    def self.history(candidate_id)
	    	#will append '/candidate/{candidate_id}/history' to base uri
	    	
	    end #history


	    def self.history_by_cycle(candidate_id, cycle)
	    	#will append '/candidate/{candidate_id}/history/{cycle}/' to base uri
	    	
	    end #history_by_cycle





	    def self.search_by_name(name)

	      #DESCRIPTION - Will append '/candidates/search/' to base_uri in order to find	


	      
	      #url = construct_url("legislators.search", {:name => name, :threshold => threshold})
	      
	      # if (response = get_json_data(url))
	        
	      #   legislators = []
	      #   response["response"]["results"].each do |result|
	      #     if result
	      #       legislator = Legislator.new(result["result"]["legislator"])
	      #       fuzzy_score = result["result"]["score"]
	            
	      #       if threshold.to_f < fuzzy_score.to_f
	      #         legislator.fuzzy_score = fuzzy_score.to_f
	      #         legislators << legislator
	      #       end
	      #     end
	      #   end
	        
	      #   if legislators.empty?
	      #     nil
	      #   else
	      #     legislators 
	      #   end
	        
	      # else
	      #   nil
	      # end
	      
	    end # def self.search_by_name



































	end #class Candidate

end #module Sunlight