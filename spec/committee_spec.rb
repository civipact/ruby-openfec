require 'spec_helper'

module OpenFecApi
  RSpec.describe Committee do
    describe '#committees' do
      context 'when configured' do
        before do
          OpenFecApi::Client.api_key = 'raGR4XbELamehq14HZCCK6i7LJ93U9Ftw0kZVU0M'
          #@client = OpenFecApi::Client.new
          #@client = OpenFecApi::Client.new('raGR4XbELamehq14HZCCK6i7LJ93U9Ftw0kZVU0M')
        end


        it "contains a valid API key" do
          @committees = OpenFecApi::Committee.new
          
          expect(@committees.has_api_key?)
        end

        it "returns responses" do
          response = OpenFecApi::Committee.all
          pp response.summary
          expect(response).to be_kind_of(OpenFecApi::Response)
        end


        it "returns responses filtered on Committee_ID" do
          options = { :committee_id => "C00563023" }
          response = OpenFecApi::Committee.all_where(options)
          expect(response.results.map{|c| c["treasurer_name"]}.uniq).to eql(["RANDI M WILLIS"])
        end

        # it "accepts pagination options and avoids rate limits" do
        #   options = {:page => 1, :per_page => 100}
        #   response = request_and_print(options)
        #   expect(response.results_count).to eql(100)
        #   while response.page < response.pages && response.page < 5 do
        #     options.merge!({:page => response.page + 1})
        #     response = request_and_print(options)
        #   end
        #   expect(true)
        # end

        it "filters committee by state" do
          options = {:state => "VA"}
          response = OpenFecApi::Committee.all_where(options)
          expect(response.results.map{|c| c["state"]}.uniq).to eql(["VA"])
        end

        it "prevents unrecognized params from being requested" do
          unrecognized_params = {:favorite_show => "Seinfeld"}
          response = OpenFecApi::Committee.all_where(unrecognized_params)
          recognized_params = response.request_query
          expect(!recognized_params.keys.include?("favorite_show"))
        end

      end
    end
  end
end
