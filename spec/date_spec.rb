require 'spec_helper'

module OpenFec
  RSpec.describe Schedule do
    describe '#schedules' do
      context 'Basic setup' do
        before do
          OpenFec::Client.api_key = ENV['OPEN_FEC_API_KEY']
        end


        it "contains a valid api key" do
          expect(OpenFec::Client.has_api_key?).to eq(true)
        end

        it "returns calendar-dates data in json format" do
          response = OpenFec::Date.calendar_dates
          expect(response).to be_kind_of(OpenFec::Response)
        end

        it "returns election-dates data in json format" do
          response = OpenFec::Date.election_dates
          expect(response).to be_kind_of(OpenFec::Response)
        end

        it "returns reporting-dates data in json format" do
          response = OpenFec::Date.reporting_dates
          expect(response).to be_kind_of(OpenFec::Response)
        end

        it "filters election-dates on a given election year" do
          options = { 'election_year' => "2016"}
          response = OpenFec::Date.election_dates(options)
          expect(response.results.map{|c| c["election_year"]}.uniq).to eql([2016])
        end

        it "filters reporting-dates on a given report year" do
          options = { 'report_year' => "2016"}
          response = OpenFec::Date.reporting_dates(options)
          expect(response.results.map{|c| c["report_year"]}.uniq).to eql([2016])
        end

        # it " " do

        # end

      end #context "when Configured"
    end #describe schedule
  end #Rspec.describe
end #OpenFec
