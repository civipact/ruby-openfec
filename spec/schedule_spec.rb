require 'spec_helper'

module OpenFecApi
  RSpec.describe Schedule do
    describe '#schedules' do
      context 'Basic setup' do
        before do
          OpenFecApi::Client.api_key = 'raGR4XbELamehq14HZCCK6i7LJ93U9Ftw0kZVU0M'
        end


        it "contains a valid API key" do
          @schedules = OpenFecApi::Schedule.new
          expect(@schedules.has_api_key?)
        end


        it "returns schedule A data in json format" do
          response = OpenFecApi::Schedule.a_all
          pp response.summary
          expect(response).to be_kind_of(OpenFecApi::Response)
        end


        it "returns all schedule A data by contributor" do
          response = OpenFecApi::Schedule.a_by_contributor
          pp response.summary
          expect(response).to be_kind_of(OpenFecApi::Response)
        end

        it "returns a Committee's schedule A data by contributor" do
          options = { 'committee_id' => 'C00000729'}
          response = OpenFecApi::Schedule.a_by_contributor(options)
          pp response.summary
          expect(response).to be_kind_of(OpenFecApi::Response)
        end


        it "returns all schedule A data by employer" do
          response = OpenFecApi::Schedule.a_by_employer
          pp response.summary
          expect(response).to be_kind_of(OpenFecApi::Response)
        end

        it "returns a Committee's schedule A data by employer" do
          options = { 'committee_id' => 'C00000729'}
          response = OpenFecApi::Schedule.a_by_employer(options)
          pp response.summary
          expect(response).to be_kind_of(OpenFecApi::Response)
        end

        it "returns all schedule A data by occupation" do
          response = OpenFecApi::Schedule.a_by_occupation
          pp response.summary
          expect(response).to be_kind_of(OpenFecApi::Response)
        end

        it "returns a Committee's schedule A data by occupation" do
          options = { 'committee_id' => 'C00000729'}
          response = OpenFecApi::Schedule.a_by_occupation(options)
          pp response.summary
          expect(response).to be_kind_of(OpenFecApi::Response)
        end


        it "returns all schedule A data by size" do
          response = OpenFecApi::Schedule.a_by_size
          pp response.summary
          expect(response).to be_kind_of(OpenFecApi::Response)
        end

        it "returns a Committee's schedule A data by size" do
          options = { 'committee_id' => 'C00000729'}
          response = OpenFecApi::Schedule.a_by_size(options)
          pp response.summary
          expect(response).to be_kind_of(OpenFecApi::Response)
        end

        it "returns all schedule A data by state" do
          response = OpenFecApi::Schedule.a_by_state
          pp response.summary
          expect(response).to be_kind_of(OpenFecApi::Response)
        end

        it "returns a Committee's schedule A data by state" do
          options = { 'committee_id' => 'C00000729'}
          response = OpenFecApi::Schedule.a_by_state(options)
          pp response.summary
          expect(response).to be_kind_of(OpenFecApi::Response)
        end

        it "returns all schedule A data by zip" do
          response = OpenFecApi::Schedule.a_by_zip
          pp response.summary
          expect(response).to be_kind_of(OpenFecApi::Response)
        end











        it "returns all schedule B data by purpose" do
          response = OpenFecApi::Schedule.b_by_purpose
          pp response.summary
          expect(response).to be_kind_of(OpenFecApi::Response)
        end

        it "returns a Committee's schedule B data by purpose" do
          options = { 'committee_id' => 'C00000729'}
          response = OpenFecApi::Schedule.b_by_purpose(options)
          pp response.summary
          expect(response).to be_kind_of(OpenFecApi::Response)
        end



		# it "returns a committee's schedule A data by contributor type" do

  #       end


  #       it "returns a committee's schedule A data by employer" do

  #       end


  #       it "returns a committee's schedule A data by size" do

  #       end


  #       it "returns a committee's schedule A data by state" do

  #       end


  #       it "returns a committee's schedule A data by zip" do

  #       end


  #       it "returns all schedule A data by occupation" do

  #       end  


  #       it "returns all schedule A data by contributor" do

  #       end   


  #       it "returns all schedule A data by employer" do

  #       end  


  #       it "returns all schedule A data by contributor type, by candidate" do

  #       end   


  #       it "returns all schedule A data by occupation" do

  #       end   


  #       it "returns all schedule A data by size" do

  #       end   


  #       it "returns all schedule A data by size, by candidate" do

  #       end    


  #       it "returns all schedule A data by state" do

  #       end   


  #       it "returns all schedule A data by state, by candidate" do

  #       end   


  #       it "returns all schedule A data by zip" do

  #       end   


        it "returns all schedule B data in json format" do
          response = OpenFecApi::Schedule.b_all
          pp response.summary
          expect(response).to be_kind_of(OpenFecApi::Response)
        end   


		# it "returns all schedule B data by purpose" do

  #       end  


  #       it "returns all schedule B data by recipient" do

  #       end 


  #       it "returns all schedule B data by recipient id" do

  #       end 


  #       it "returns all schedule B data by candidate" do

  #       end 


		# it "returns a committee's schedule B data by purpose" do

  #       end 


  #       it "returns a committee's schedule B data by recipient" do

  #       end 


  #       it "returns a committee's schedule B data by recipient id" do

  #       end 


  #       it "returns a committee's schedule B data by candidate" do

  #       end 


        it "returns all schedule E data in json format" do
          response = OpenFecApi::Schedule.e_all
          pp response.summary
          expect(response).to be_kind_of(OpenFecApi::Response)
        end 


        # it "returns allows filtering on all schedule E data" do

        # end 

      # context 'by contributor' do

      # end



Schedule.b_all
Schedule.b_by_purpose({options})


Schedule.e_all


      end #context "when Configured"
    end #describe schedule
  end #Rspec.describe
end #OpenFec
