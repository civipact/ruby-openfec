require 'spec_helper'

module OpenFec
  RSpec.describe Schedule do
    describe '#Financial' do
      context 'Basic setup' do
        before do
          OpenFec::Client.api_key = ENV['OPEN_FEC_API_KEY']
        end

        it "contains a valid api key" do
          expect(OpenFec::Client.has_api_key? == true)
        end

        it "returns committee reports financial data in json format" do
          committee_id = 'C00563023'
          response = OpenFec::Financial.committee_reports(committee_id)
          puts response.results
          expect(response).to be_kind_of(OpenFec::Response)
        end

        it "returns committee totals financial data in json format" do
          committee_id = 'C00563023'
          response = OpenFec::Financial.committee_totals(committee_id)
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
          response = OpenFec::Financial.reports_by_committee_type(committee_type)
          expect(response).to be_kind_of(OpenFec::Response)
        end


        it "allows create of class instance, and returns json data" do
          search_query = { 'office' => 'president', 'cycle' => '2000'} 
          response = OpenFec::Financial.elections(search_query)
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