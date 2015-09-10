require 'httparty'

module OpenFecApi
  class Client
    attr_reader :api_key
    include HTTParty
    base_uri 'https://api.open.fec.gov/v1'
    #@@api_key = 
    @@api_key = '' #Initialize API Key to blank string

    def self.api_key
     @@api_key
    end

    def self.api_key=(key)
     @@api_key = key
    end


    # def initialize(api_key)
    #    @api_key = @@api_key
    # end

    def has_api_key?
      !self.api_key.nil? || !self.api_key.eql?('')
    end

    def candidates(options = {})
      query = {'api_key' => @@api_key}
      request_params = ["sort", "sort_hide_null", "year", "office", "candidate_status", "party", "state", "cycle", "district", "incumbent_challenge", "name", "candidate_id", "page", "per_page"]
      request_options = options.select{|k,v| request_params.include?(k.to_s)}
      request_options.each do |k,v|
        query.merge!({k.to_s => v})
      end
      response = self.class.get("/candidates", query: query)
      return Response.new(response)
    end #candidates



    #Committee endpoint
    #
    # https://api.open.fec.gov/developers#!/committee/get_committees
    # @param [Hash] options
    #
    #
    #
    #






    def committees(options = {})
      query = {'api_key' => @@api_key}
      request_params = ["page", "per_page", "year", "designation", "committee_type", "organization_type", "cycle", "party", "min_first_file_date", "candidate_id", "state", "committee_id", "name", "q", "max_first_file_date", "sort", "sort_hide_null", "sort_nulls_large"]
      request_options = options.select{|key,value| request_params.include?(key.to_s)}
      request_options.each do |key,value|
        query.merge!({key.to_s => value})
      end
      response = self.class.get("/committees", query: query)
      return Response.new(response)
    end #committees





  end #class Client
end #module OpenFecAPI 
