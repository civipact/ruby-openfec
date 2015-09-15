require 'spec_helper'

module OpenFec
  RSpec.describe Schedule do
    describe '#schedules' do
      context 'Basic setup' do
        before do
          OpenFec::Client.api_key = 'raGR4XbELamehq14HZCCK6i7LJ93U9Ftw0kZVU0M'
        end


        it "contains a valid API key" do
          @schedules = OpenFec::Schedule.new
          expect(@schedules.has_api_key?)
        end


        it "returns schedule A data in json format" do
          @schedules = OpenFec::Schedule.new
          response = @schedules.a_all
          #pp response.summary
          expect(response).to be_kind_of(OpenFec::Schedule_Response)
        end


        it "returns all schedule A data by contributor" do
          @schedules = OpenFec::Schedule.new
          response = @schedules.a_by_contributor
          #response = OpenFec::Schedule.a_by_contributor
          #pp response.summary
          expect(response).to be_kind_of(OpenFec::Schedule_Response)
        end

        it "returns a Committee's schedule A data by contributor" do
          options = { 'committee_id' => 'C00000729'}
          @schedules = OpenFec::Schedule.new
          response = @schedules.a_by_contributor(options)
          #response = OpenFec::Schedule.a_by_contributor(options)
          #pp response.summary
          expect(response).to be_kind_of(OpenFec::Schedule_Response)
        end


        it "returns all schedule A data by employer" do
          @schedules = OpenFec::Schedule.new
          response = @schedules.a_by_employer
          #response = OpenFec::Schedule.a_by_employer
          #pp response.summary
          expect(response).to be_kind_of(OpenFec::Schedule_Response)
        end

        it "returns a Committee's schedule A data by employer" do
          options = { 'committee_id' => 'C00000729'}
          @schedules = OpenFec::Schedule.new
          response = @schedules.a_by_employer(options)
          #response = OpenFec::Schedule.a_by_employer(options)
          #pp response.summary
          expect(response).to be_kind_of(OpenFec::Schedule_Response)
        end

        it "returns all schedule A data by occupation" do
          @schedules = OpenFec::Schedule.new
          response = @schedules.a_by_occupation
          #response = OpenFec::Schedule.a_by_occupation
          #pp response.summary
          expect(response).to be_kind_of(OpenFec::Schedule_Response)
        end

        it "returns a Committee's schedule A data by occupation" do
          options = { 'committee_id' => 'C00000729'}
          @schedules = OpenFec::Schedule.new
          response = @schedules.a_by_occupation(options)
          #response = OpenFec::Schedule.a_by_occupation(options)
          #pp response.summary
          expect(response).to be_kind_of(OpenFec::Schedule_Response)
        end


        it "returns all schedule A data by size" do
          @schedules = OpenFec::Schedule.new
          response = @schedules.a_by_size
          #response = OpenFec::Schedule.a_by_size
          #pp response.summary
          expect(response).to be_kind_of(OpenFec::Schedule_Response)
        end

        it "returns a Committee's schedule A data by size" do
          options = { 'committee_id' => 'C00000729'}
          @schedules = OpenFec::Schedule.new
          response = @schedules.a_by_size(options)
          #response = OpenFec::Schedule.a_by_size(options)
          #pp response.summary
          expect(response).to be_kind_of(OpenFec::Schedule_Response)
        end

        it "returns all schedule A data by state" do
          @schedules = OpenFec::Schedule.new
          response = @schedules.a_by_state
          #response = OpenFec::Schedule.a_by_state
          #pp response.summary
          expect(response).to be_kind_of(OpenFec::Schedule_Response)
        end

        it "returns a Committee's schedule A data by state" do
          options = { 'committee_id' => 'C00000729'}
          @schedules = OpenFec::Schedule.new
          response = @schedules.a_by_state(options)
          #response = OpenFec::Schedule.a_by_state(options)
          #pp response.summary
          expect(response).to be_kind_of(OpenFec::Schedule_Response)
        end

        it "returns all schedule A data by zip" do
          @schedules = OpenFec::Schedule.new
          response = @schedules.a_by_zip
          #response = OpenFec::Schedule.a_by_zip
          #pp response.summary
          expect(response).to be_kind_of(OpenFec::Schedule_Response)
        end











        it "returns all schedule B data by purpose" do
          @schedules = OpenFec::Schedule.new
          response = @schedules.b_by_purpose
          #response = OpenFec::Schedule.b_by_purpose
          #pp response.summary
          expect(response).to be_kind_of(OpenFec::Schedule_Response)
        end

        it "returns a Committee's schedule B data by purpose" do
          options = { 'committee_id' => 'C00000729'}
          @schedules = OpenFec::Schedule.new
          response = @schedules.b_by_purpose(options)
          #response = OpenFec::Schedule.b_by_purpose(options)
          #pp response.summary
          expect(response).to be_kind_of(OpenFec::Schedule_Response)
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
          @schedules = OpenFec::Schedule.new
          response = @schedules.b_all
          #response = OpenFec::Schedule.b_all
          #pp response.summary
          expect(response).to be_kind_of(OpenFec::Schedule_Response)
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
          @schedules = OpenFec::Schedule.new
          response = @schedules.e_all
          #response = OpenFec::Schedule.e_all
          #pp response.summary
          expect(response).to be_kind_of(OpenFec::Schedule_Response)
        end 


        # it "returns allows filtering on all schedule E data" do

        # end 

      # context 'by contributor' do

      # end


      end #context "when Configured"
    end #describe schedule
  end #Rspec.describe
end #OpenFec
