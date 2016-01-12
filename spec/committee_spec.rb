require 'spec_helper'

module OpenFec
  RSpec.describe Committee do
    describe '#committees' do
      context 'when configured' do
        before do
          OpenFec::Client.api_key = ENV['OPEN_FEC_API_KEY']
        end


        it "contains a valid api key" do
          expect(OpenFec::Client.has_api_key? == true)
        end


        it "returns valid json responses" do
          response = OpenFec::Committee.all
          expect(response).to be_kind_of(OpenFec::Response)
        end


        it "returns responses filtered on Committee_ID" do
          options = { 'committee_id' => "C00563023" }
          response = OpenFec::Committee.all_where(options)
          expect(response.results.map{|c| c["treasurer_name"]}.uniq).to eql(["RANDI M WILLIS"])
        end


        it "filters committee by state" do
          options = {:state => "VA"}
          response = OpenFec::Committee.all_where(options)
          expect(response.results.map{|c| c["state"]}.uniq).to eql(["VA"])
        end


        it "prevents unrecognized params from being requested" do
          unrecognized_params = {:favorite_show => "Seinfeld"}
          response = OpenFec::Committee.all_where(unrecognized_params)
          recognized_params = response.request_query
          expect(!recognized_params.keys.include?("favorite_show"))
        end


        it "returns Committee history" do
          options = "C00462390"
          response = OpenFec::Committee.history(options)
          expect(response.results.map{|c| c["treasurer_name"]}.uniq).to eql(["EDEAN BUNDICK"])
        end


        it "returns Committee history by cycle" do
          id = "C00462390"
          cyc = "2012"
          response = OpenFec::Committee.history_by_cycle(id, cyc)
          expect(response.results.map{|c| c["treasurer_name"]}.uniq).to eql(["EDEAN BUNDICK"])
        end


        it "raises an error if one of the parameters is missing for history_by_cycle method" do
          id = "C00462390"
          cycle = nil
          expect { response = OpenFec::Committee.history_by_cycle(id, cycle) }.to raise_error(RuntimeError)
        end

      end #context
    end #describe committee
  end #Rspec.describe
end #OpenFec
