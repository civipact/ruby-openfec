require 'spec_helper'

module OpenFec
  RSpec.describe Committee do
    describe '#committees' do
      context 'when configured' do
        before do
          OpenFec::Client.api_key = 'raGR4XbELamehq14HZCCK6i7LJ93U9Ftw0kZVU0M'
        end


        it "contains a valid API key" do
          @committees = OpenFec::Committee.new
          expect(@committees.has_api_key?)
        end


        it "returns valid json responses" do
          @committees = OpenFec::Committee.new
          response = @committees.all
          #response = OpenFec::Committee.all
          expect(response).to be_kind_of(OpenFec::Response)
        end


        it "returns responses filtered on Committee_ID" do
          #options = { :committee_id => "C00563023" }
          options = { 'committee_id' => "C00563023" }
          @committees = OpenFec::Committee.new
          response = @committees.all_where(options)
          #response = OpenFec::Committee.all_where(options)
          expect(response.results.map{|c| c["treasurer_name"]}.uniq).to eql(["RANDI M WILLIS"])
        end


        it "filters committee by state" do
          options = {:state => "VA"}
          @committees = OpenFec::Committee.new
          response = @committees.all_where(options)
          #response = OpenFec::Committee.all_where(options)
          expect(response.results.map{|c| c["state"]}.uniq).to eql(["VA"])
        end


        it "prevents unrecognized params from being requested" do
          unrecognized_params = {:favorite_show => "Seinfeld"}
          @committees = OpenFec::Committee.new
          response = @committees.all_where(unrecognized_params)
          #response = OpenFec::Committee.all_where(unrecognized_params)
          recognized_params = response.request_query
          expect(!recognized_params.keys.include?("favorite_show"))
        end


        it "returns Committee history" do
          options = "C00462390"
          @committees = OpenFec::Committee.new
          response = @committees.history(options)
          #response = OpenFec::Committee.history(options)
          expect(response.results.map{|c| c["treasurer_name"]}.uniq).to eql(["EDEAN BUNDICK"])
        end


        it "returns Committee history by cycle" do
          id = "C00462390"
          cyc = "2012"
          @committees = OpenFec::Committee.new
          response = @committees.history_by_cycle(id,cyc)
          #response = OpenFec::Committee.history_by_cycle(id, cyc)
          expect(response.results.map{|c| c["treasurer_name"]}.uniq).to eql(["EDEAN BUNDICK"])
        end


        it "raises an error if one of the parameters is missing for history_by_cycle method" do
          id = "C00462390"
          cycle = nil
          @committees = OpenFec::Committee.new
          expect { response = @committees.history_by_cycle(id, cycle) }.to raise_error(RuntimeError)
        end


        # it "will return a list of communication costs for a given committee, by candidate_id" do
        #   committee_id = "C70002126"
        #   response = OpenFec::Committee.communication_costs(committee_id)
        #   expect(response.results.committee.map{|c| c["name"]}.uniq).to eql(["UNITED MINE WORKERS OF AMERICA COAL MINERS POLITICAL ACTION COMMITTEE"])
        # end

      end #context
    end #describe committee
  end #Rspec.describe
end #OpenFec
