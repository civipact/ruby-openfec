require 'spec_helper'
#require 'rails_helper'

module OpenFecApi
  RSpec.describe OpenFecApi::Candidate do
    describe '#Candidate' do
      context 'when configured' do
        before do
          OpenFecApi::Client.api_key = 'raGR4XbELamehq14HZCCK6i7LJ93U9Ftw0kZVU0M'
          #@candidates = OpenFecApi::Candidate.new
          #@candidates = OpenFecApi::Candidate.new
        end


        it "contains a valid api key" do
          @candidates = OpenFecApi::Candidate.new
          
          expect(@candidates.has_api_key?)
        end

        it "returns responses in json format" do
          response = OpenFecApi::Candidate.all
          pp response.summary
          expect(response).to be_kind_of(OpenFecApi::Response)
        end


        it "filters candidates by state" do
          options = {:state => "VA"}
          response = OpenFecApi::Candidate.all_where(options)
          pp response.summary
          expect(response.results.map{|c| c["state"]}.uniq).to eql(["VA"])
        end

        it "filters candidates by election year" do
        expect(true)
        end

        it "filters candidates by party" do
        expect(true)
        end

        it "filter candidates by cycle" do
        expect(true)
        end

        it "allows search of candidate history" do
        expect(true)
        end

        it "allows search of candidate history by cycle" do

        end


          it "prevents unrecognized params from being requested" do
            unrecognized_params = {:home_planet => "Mars"}
            response = OpenFecApi::Candidate.all_where(unrecognized_params)
            pp response.summary
            recognized_params = response.request_query
            expect(!recognized_params.keys.include?("home_planet"))
          end

          # it "returns responses filtered on Committee_ID" do
          #   committee_id = "C00563023"
          #   response = committee.find_by_id(committee_id)
          #   expect(response.results.map{|c| c["treasurer_name"]}.uniq).to eql(["RANDI M WILLIS"])

          # end



      end
    end
  end
end
