require 'spec_helper'
require 'json'
#require 'rails_helper'

module OpenFec
  RSpec.describe OpenFec::Candidate do
    describe '#Candidate' do
      context 'When configured' do
        before do
          OpenFec::Client.api_key = ENV['OPEN_FEC_API_KEY']
        end

        it "contains a valid api key" do
          expect(OpenFec::Client.has_api_key? == true)
        end

        it "returns responses in json format" do
          response = OpenFec::Candidate.all
          expect(response).to be_kind_of(OpenFec::Response)
        end

        it "filters candidates by state" do
          options = {:state => "VA"}
          response = OpenFec::Candidate.all_where(options)
          expect(response.results.map{|c| c["state"]}.uniq).to eql(["VA"])
        end

        it "filters candidates by party" do
          options = {:party => "DEM"}
          response = OpenFec::Candidate.all_where(options)
          
          expect(response.results.map{|c| c["party"]}.uniq).to eql(["DEM"])
        end

        it "filters candidates by cycle" do
          options = {:cycle => "1980"}
          response = OpenFec::Candidate.all_where(options)
          
          cycs = response.results.map{|c| c["cycle"]}.uniq
          expect(cycs.include?("1980"))
        end

        it "allows search of candidates by name" do
          options = "Henry"
          response = OpenFec::Candidate.history(options)
          names = response.results.map{|c| c["name"]}.uniq
          expect(names.include?("KELLEY, HENRY ARTHUR JR"))
        end

        it "allows search of candidate history by candidate_id" do
          id = "H0AK00014"
          response = OpenFec::Candidate.history(id)
          expect(response.results.map{|c| c["name"]}.uniq).to eql(["WHITTAKER, RICHARD"])
        end

        # it "allows search of candidate history by candidate_id and cycle" do
        #   id = "H0AK00014"
        #   cyc = "1980"
        #   response = OpenFec::Candidate.history_by_cycle(id, cyc)
        #   expect(response.results.map{|c| c["candidate_status_full"]}.uniq).to eql(["Statutory candidate"])
        # end

        it "prevents unrecognized params from being requested" do
          unrecognized_params = {:home_planet => "Mars"}
          response = OpenFec::Candidate.all_where(unrecognized_params)
          recognized_params = response.request_query
          expect(!recognized_params.keys.include?("home_planet"))
        end

        it "will list all committees associated with a candidate_id" do
          id = "H0AK00014"
          response = OpenFec::Candidate.committees(id)
          expect(response.results.map{|c| c["city"]}.uniq).to eql(["KETCHIKAW"])
        end

        it "will return history about a given candidate's committtees" do
          id = "S8MN00438"
          response = OpenFec::Candidate.committee_history(id)
          cmttee_names = response.results.map{|c| c["name"]}.uniq
          expect(cmttee_names.include?("AL FRANKEN FOR SENATE 2014"))
        end

        it "will show communication costs for each candidate " do
          id = "H0AL03036"
          response = OpenFec::Candidate.communication_costs(id)
          treas_names = response.results.map{|c| c["treasurer_name"]}.uniq
          expect(treas_names.include?("JOHN J BANOVIC"))
        end

        it "returns a list of committe names for a given candidate " do
          id = "H4IL07037"
          response = OpenFec::Candidate.committees(id)
          @committee_names = response.all_committees
          expect(@committee_names.include?("DAVIS FOR CONGRESS/FRIENDS OF DAVIS"))
        end

      end #context
    end #describe candidate
  end #RSPEC.describe Candidate
end #module OpenFec
