require 'spec_helper'

module OpenFec
  RSpec.describe Schedule do
    describe '#Financial' do
      context 'Basic setup' do
        before do
          OpenFec::Client.api_key = 'raGR4XbELamehq14HZCCK6i7LJ93U9Ftw0kZVU0M'
        end



        it "contains a valid API key" do
          @fin = OpenFec::Financial.new
          puts @fin.api_key
          expect(@fin.has_api_key?)
        end

        it "returns committee reports financial data in json format" do
          @financials = OpenFec::Financial.new
          committee_id = 'C00563023'

          response = @financials.committee_reports(committee_id)
          #pp response.summary
          puts response.results
          expect(response).to be_kind_of(OpenFec::Response)
        end

        it "returns committee totals financial data in json format" do
          committee_id = 'C00563023'
          @financials = OpenFec::Financial.new
          response = @financials.committee_totals(committee_id)
          #response = OpenFec::Financial.committee_totals(committee_id)
          #pp response.summary
          puts response.results
          expect(response).to be_kind_of(OpenFec::Financial_Response)
        end


        # it "returns elections financial data in json format" do
        #   search_query = { 'office' => 'presidential', 'cycle' => '2000'} 
        #   response = OpenFec::Financial.elections(search_query)
        #   #pp response.summary
        #   expect(response).to be_kind_of(OpenFec::Response)
        # end


        it "returns committee reports financial data in json format" do
          committee_type = 'presidential'
          @financials = OpenFec::Financial.new  
          response = @financials.reports_by_committee_type(committee_type)
        #   response = OpenFec::Financial.reports_by_committee_type(committee_type)
        #   #pp response.summary
          expect(response).to be_kind_of(OpenFec::Response)
        end


        it "allows create of class instance, and returns json data" do
          @financials = OpenFec::Financial.new
          search_query = { 'office' => 'president', 'cycle' => '2000'} 
          response = @financials.elections(search_query)
          #puts response.results[:state]
          # response = OpenFec::Financial.elections(search_query)
          # response = OpenFec::Financial.reports_by_committee_type(committee_type)
          #pp response.summary
          expect(response).to be_kind_of(OpenFec::Financial_Response)
        end


        # it "returns elections search data in json format" do
        #   search_query = { 'office' => 'senate' }
        #   response = OpenFec::Search.elections(search_query)
        #   expect(response).to be_kind_of(OpenFec::Response)
        # end                                




      end #context
    end #describe Financial
  end #Rspec.describe
end #OpenFec