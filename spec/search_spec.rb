require 'spec_helper'

module OpenFec
  RSpec.describe Schedule do
    describe '#Search' do
      context 'Basic setup' do
        before do
          OpenFec::Client.api_key = 'STUB_API_KEY'
        end



        it "contains a valid api key" do
          expect(OpenFec::Client.has_api_key? == true)
        end

        it "returns candidate search data in json format" do
          search_query = 'John'
          response = OpenFec::Search.candidates(search_query)
          expect(response).to be_kind_of(OpenFec::Response)
        end

        it "returns committee search data in json format" do
          search_query = 'Congress'
          response = OpenFec::Search.committees(search_query)
          expect(response).to be_kind_of(OpenFec::Response)
        end


        it "returns filings search data in json format" do
          search_query = { 'report_year' => '2000' }
          response = OpenFec::Search.filings(search_query)
          expect(response).to be_kind_of(OpenFec::Response)
        end


        it "returns reporting dates search data in json format" do
          search_query = { 'report_year' => '2000' }
          response = OpenFec::Search.reporting_dates(search_query)
          expect(response).to be_kind_of(OpenFec::Response)
        end


        it "returns elections search data in json format" do
          search_query = { 'office' => 'senate' }
          response = OpenFec::Search.elections(search_query)
          expect(response).to be_kind_of(OpenFec::Response)
        end                                

      end #context
    end #describe Search
  end #Rspec.describe
end #OpenFec