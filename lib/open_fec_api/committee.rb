module OpenFecApi
	class Committee < Client

	    def self.all
	    	#Will append '/committees/' to base uri
	    	query = {'api_key' => @@api_key }
	        response = self.get("/committees", query: query)
	        return Response.new(response)	
	    end #all

	    def self.all_sort_by(field)
	    	#Will append '/committees/' to base uri
	    	#and sort on the field passed in by 'field' parameter
	    	request_params = ["sort", "sort_hide_null", "year", "office", "candidate_status", "party", "state", "cycle", "district", "incumbent_challenge", "name", "candidate_id", "page", "per_page"]
	    end #all_sort_by


	    def self.all_where(options)
	    	#will append /committees/ to base uri and accept hash of options
	    	query = {'api_key' => @@api_key }
	    	valid_params = ["page", "per_page", "year", "designation", "committee_type", "organization_type", "cycle", "party", "min_first_file_date", "candidate_id", "state", "committee_id", "name", "q", "max_first_file_date", "sort", "sort_hide_null", "sort_nulls_large"]
	    	request_params = options.select{|key, value| valid_params.include?(key.to_s)}

	   		request_params.each do |key, value|
	          query.merge!({key.to_s => value})
	        end

	        response = self.get("/committees", query: query)
	        return Response.new(response)
	    end #all_where



	end #class Committee

end #module Sunlight