require 'spec_helper'

module OpenFec
  RSpec.describe Schedule do
    describe '#Search' do
      context 'Basic setup' do
        before do
          OpenFec::Client.api_key = 'raGR4XbELamehq14HZCCK6i7LJ93U9Ftw0kZVU0M'
        end



        it "contains a valid API key" do
          @search = OpenFec::Search.new
          expect(@search.has_api_key?)
        end

        it "returns candidate search data in json format" do
          search_query = 'John'
          @search = OpenFec::Search.new
          response = @search.candidates(search_query)
          #response = OpenFec::Search.candidates(search_query)
          #pp response.summary
          expect(response).to be_kind_of(OpenFec::Response)
        end

        it "returns committee search data in json format" do
          search_query = 'Congress'
          @search = OpenFec::Search.new
          response = @search.committees(search_query)
          #response = OpenFec::Search.committees(search_query)
          #pp response.summary
          expect(response).to be_kind_of(OpenFec::Response)
        end


        it "returns filings search data in json format" do
          search_query = { 'report_year' => '2000' }
          @search = OpenFec::Search.new
          response = @search.filings(search_query)
          #response = OpenFec::Search.filings(search_query)
          expect(response).to be_kind_of(OpenFec::Response)
        end


        it "returns reporting dates search data in json format" do
          search_query = { 'report_year' => '2000' }
          @search = OpenFec::Search.new
          response = @search.reporting_dates(search_query)
          #response = OpenFec::Search.reporting_dates(search_query)
          expect(response).to be_kind_of(OpenFec::Response)
        end


        it "returns elections search data in json format" do
          search_query = { 'office' => 'senate' }
          @search = OpenFec::Search.new
          response = @search.elections(search_query)
          #response = OpenFec::Search.elections(search_query)
          expect(response).to be_kind_of(OpenFec::Response)
        end                                





      end #context
    end #describe Search
  end #Rspec.describe
end #OpenFec