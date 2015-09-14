require 'spec_helper'

module OpenFecApi
  RSpec.describe Schedule do
    describe '#Search' do
      context 'Basic setup' do
        before do
          OpenFecApi::Client.api_key = 'raGR4XbELamehq14HZCCK6i7LJ93U9Ftw0kZVU0M'
        end



        it "contains a valid API key" do
          @search = OpenFecApi::Search.new
          expect(@search.has_api_key?)
        end

        it "returns candidate search data in json format" do
          search_query = 'John'
          response = OpenFecApi::Search.candidates(search_query)
          #pp response.summary
          expect(response).to be_kind_of(OpenFecApi::Response)
        end

        it "returns committee search data in json format" do
          search_query = 'Congress'
          response = OpenFecApi::Search.committees(search_query)
          #pp response.summary
          expect(response).to be_kind_of(OpenFecApi::Response)
        end


        it "returns filings search data in json format" do
          search_query = { 'report_year' => '2000' }
          response = OpenFecApi::Search.filings(search_query)
          expect(response).to be_kind_of(OpenFecApi::Response)
        end


        it "returns reporting dates search data in json format" do
          search_query = { 'report_year' => '2000' }
          response = OpenFecApi::Search.reporting_dates(search_query)
          expect(response).to be_kind_of(OpenFecApi::Response)
        end


        it "returns elections search data in json format" do
          search_query = { 'office' => 'senate' }
          response = OpenFecApi::Search.elections(search_query)
          expect(response).to be_kind_of(OpenFecApi::Response)
        end                                





      end #context
    end #describe Search
  end #Rspec.describe
end #OpenFec