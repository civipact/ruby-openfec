require 'spec_helper'
#

module OpenFecApi
  RSpec.describe Client do
    describe '#Client' do
      context 'When configured' do
        before do
          OpenFecApi::Client.api_key = 'raGR4XbELamehq14HZCCK6i7LJ93U9Ftw0kZVU0M'
          @client = OpenFecApi::Client.new
        end

 
        it "contains a valid api key" do
          @client = OpenFecApi::Client.new
          expect(@client.has_api_key?)
        end

        # #MAJOR EDITS NEEDED HERE!
        # it "returns responses" do
        #   response = @client.candidates
        #   expect(response).to be_kind_of(OpenFecApi::Response)
        # end

        # it "accepts pagination options and avoids rate limits" do
        #   options = {:page => 1, :per_page => 100}
        #   response = request_and_print(options)
        #   expect(response.results_count).to eql(100)
        #   while response.page < response.pages && response.page < 5 do
        #     options.merge!({:page => response.page + 1})
        #     response = request_and_print(options)
        #   end
        #   success = true
        #   expect(success)
        # end

        # it "accepts endpoint-specific options" do
        #   options = {:party => "DEM"}
        #   response = request_and_print(options)
        #   expect(response.results.map{|c| c["party"]}.uniq).to eql(["DEM"])
        # end

        # it "prevents unrecognized params from being requested" do
        #   unrecognized_params = {:hair_color => "brown"}
        #   response = request_and_print(unrecognized_params)
        #   recognized_params = response.request_query
        #   expect(!recognized_params.keys.include?("hair_color"))

      end #context 'When configured'

      context 'When incorrect key provided' do

      end #context "When incorrect key provided"





    end #describe #Client
  end #RSpec Describe Client
end #modeule OpenFecApi
