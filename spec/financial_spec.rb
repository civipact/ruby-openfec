require 'spec_helper'

module OpenFecApi
  RSpec.describe Schedule do
    describe '#Financial' do
      context 'Basic setup' do
        before do
          OpenFecApi::Client.api_key = 'raGR4XbELamehq14HZCCK6i7LJ93U9Ftw0kZVU0M'
        end



        it "contains a valid API key" do
          @search = OpenFecApi::Financial.new
          expect(@search.has_api_key?)
        end

        it "returns committee reports financial data in json format" do
          committee_id = 'John'
          response = OpenFecApi::Financial.committee_reports(committee_id)
          #pp response.summary
          expect(response).to be_kind_of(OpenFecApi::Response)
        end

        it "returns committee totals financial data in json format" do
          committee_id = 'John'
          response = OpenFecApi::Financial.committee_totals(committee_id)
          #pp response.summary
          expect(response).to be_kind_of(OpenFecApi::Response)
        end


        it "returns elections financial data in json format" do
          search_query = { 'office' => 'presidential', 'cycle' => '2000'} 
          response = OpenFecApi::Financial.elections(search_query)
          #pp response.summary
          expect(response).to be_kind_of(OpenFecApi::Response)
        end


        it "returns committee reports financial data in json format" do
          committee_type = 'presidential'
          response = OpenFecApi::Financial.reports_by_committee_type(committee_type)
          #pp response.summary
          expect(response).to be_kind_of(OpenFecApi::Response)
        end


        it "allows create of class instance, and returns json data" do
          @financials = OpenFecApi::Financial.new
          search_query = { 'office' => 'presidential', 'cycle' => '2000'} 
          response = @financials.elections(search_query)
          #response = OpenFecApi::Financial.elections(search_query)
          #response = OpenFecApi::Financial.reports_by_committee_type(committee_type)
          #pp response.summary
          expect(response).to be_kind_of(OpenFecApi::Response)
        end


        # it "returns elections search data in json format" do
        #   search_query = { 'office' => 'senate' }
        #   response = OpenFecApi::Search.elections(search_query)
        #   expect(response).to be_kind_of(OpenFecApi::Response)
        # end                                




      end #context
    end #describe Financial
  end #Rspec.describe
end #OpenFec