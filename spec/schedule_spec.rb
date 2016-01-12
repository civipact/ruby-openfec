require 'spec_helper'

module OpenFec
  RSpec.describe Schedule do
    describe '#schedules' do
      context 'Basic setup' do
        before do
        end


        it "contains a valid api key" do
          expect(OpenFec::Client.has_api_key?).to eq(true)
        end


        it "returns schedule A data in json format" do
          response = OpenFec::Schedule.a_all
          expect(response).to be_kind_of(OpenFec::Schedule_Response)
        end


        # it "returns all schedule A data by contributor" do
        #   @schedules = OpenFec::Schedule.new
        #   response = @schedules.a_by_contributor
        #   #response = OpenFec::Schedule.a_by_contributor
        #   #pp response.summary
        #   expect(response).to be_kind_of(OpenFec::Schedule_Response)
        # end

        # it "returns a Committee's schedule A data by contributor" do
        #   options = { 'committee_id' => 'C00000729'}
        #   @schedules = OpenFec::Schedule.new
        #   response = @schedules.a_by_contributor(options)
        #   #response = OpenFec::Schedule.a_by_contributor(options)
        #   #pp response.summary
        #   expect(response).to be_kind_of(OpenFec::Schedule_Response)
        # end


        # it "returns all schedule A data by employer" do
        #   @schedules = OpenFec::Schedule.new
        #   response = @schedules.a_by_employer
        #   #response = OpenFec::Schedule.a_by_employer
        #   #pp response.summary
        #   expect(response).to be_kind_of(OpenFec::Schedule_Response)
        # end

        # it "returns a Committee's schedule A data by employer" do
        #   options = { 'committee_id' => 'C00000729'}
        #   @schedules = OpenFec::Schedule.new
        #   response = @schedules.a_by_employer(options)
        #   #response = OpenFec::Schedule.a_by_employer(options)
        #   #pp response.summary
        #   expect(response).to be_kind_of(OpenFec::Schedule_Response)
        # end

        # it "returns all schedule A data by occupation" do
        #   @schedules = OpenFec::Schedule.new
        #   response = @schedules.a_by_occupation
        #   #response = OpenFec::Schedule.a_by_occupation
        #   #pp response.summary
        #   expect(response).to be_kind_of(OpenFec::Schedule_Response)
        # end

        it "returns a Committee's schedule A data by occupation" do
          options = { 'committee_id' => 'C00000729'}
          response = OpenFec::Schedule.a_by_occupation(options)
          expect(response).to be_kind_of(OpenFec::Schedule_Response)
        end


        it "returns all schedule A data by size and candidate" do
          options = {'candidate_id' => 'S4PA00121' , 'cycle' => 2010 }
          response = OpenFec::Schedule.a_by_size_and_candidate(options)
          expect(response).to be_kind_of(OpenFec::Schedule_Response)
        end

  #       it "returns a Committee's schedule A data by size" do
  #         options = { 'committee_id' => 'C00000729'}
  #         @schedules = OpenFec::Schedule.new
  #         response = @schedules.a_by_size(options)
  #         #response = OpenFec::Schedule.a_by_size(options)
  #         #pp response.summary
  #         expect(response).to be_kind_of(OpenFec::Schedule_Response)
  #       end

  #       it "returns a Candidate's schedule A data by size" do
  #         options = { 'committee_id' => 'C00000729'}
  #         @schedules = OpenFec::Schedule.new
  #         response = @schedules.a_by_size(options)
  #         #response = OpenFec::Schedule.a_by_size(options)
  #         #pp response.summary
  #         expect(response).to be_kind_of(OpenFec::Schedule_Response)
  #       end


  #       it "returns all schedule A data by state" do
  #         @schedules = OpenFec::Schedule.new
  #         response = @schedules.a_by_state
  #         #response = OpenFec::Schedule.a_by_state
  #         #pp response.summary
  #         expect(response).to be_kind_of(OpenFec::Schedule_Response)
  #       end

  #       it "returns a Committee's schedule A data by state" do
  #         options = { 'committee_id' => 'C00000729'}
  #         @schedules = OpenFec::Schedule.new
  #         response = @schedules.a_by_state(options)
  #         #response = OpenFec::Schedule.a_by_state(options)
  #         #pp response.summary
  #         expect(response).to be_kind_of(OpenFec::Schedule_Response)
  #       end

  #       it "returns all schedule A data by zip" do
  #         @schedules = OpenFec::Schedule.new
  #         response = @schedules.a_by_zip
  #         #response = OpenFec::Schedule.a_by_zip
  #         #pp response.summary
  #         expect(response).to be_kind_of(OpenFec::Schedule_Response)
  #       end


  #       it "returns all schedule B data by purpose" do
  #         @schedules = OpenFec::Schedule.new
  #         response = @schedules.b_by_purpose
  #         #response = OpenFec::Schedule.b_by_purpose
  #         #pp response.summary
  #         expect(response).to be_kind_of(OpenFec::Schedule_Response)
  #       end

  #       it "returns a Committee's schedule B data by purpose" do
  #         options = { 'committee_id' => 'C00000729'}
  #         @schedules = OpenFec::Schedule.new
  #         response = @schedules.b_by_purpose(options)
  #         #response = OpenFec::Schedule.b_by_purpose(options)
  #         #pp response.summary
  #         expect(response).to be_kind_of(OpenFec::Schedule_Response)
  #       end



		# # it "returns a committee's schedule A data by contributor type" do

  # #       end


  # #       it "returns a committee's schedule A data by employer" do

  # #       end


  # #       it "returns a committee's schedule A data by size" do

  # #       end


  # #       it "returns a committee's schedule A data by state" do

  # #       end


  # #       it "returns a committee's schedule A data by zip" do

  # #       end


  # #       it "returns all schedule A data by occupation" do

  # #       end  


  # #       it "returns all schedule A data by contributor" do

  # #       end   


  # #       it "returns all schedule A data by employer" do

  # #       end  


  # #       it "returns all schedule A data by contributor type, by candidate" do

  # #       end   


  # #       it "returns all schedule A data by occupation" do

  # #       end   


  # #       it "returns all schedule A data by size" do

  # #       end   


  # #       it "returns all schedule A data by size, by candidate" do

  # #       end    


  # #       it "returns all schedule A data by state" do

  # #       end   


  # #       it "returns all schedule A data by state, by candidate" do

  # #       end   


  # #       it "returns all schedule A data by zip" do

  # #       end   


  #       it "returns all schedule B data in json format" do
  #         @schedules = OpenFec::Schedule.new
  #         response = @schedules.b_all
  #         #response = OpenFec::Schedule.b_all
  #         #pp response.summary
  #         expect(response).to be_kind_of(OpenFec::Schedule_Response)
  #       end   


		# # it "returns all schedule B data by purpose" do

  # #       end  


  # #       it "returns all schedule B data by recipient" do

  # #       end 


  # #       it "returns all schedule B data by recipient id" do

  # #       end 


  # #       it "returns all schedule B data by candidate" do

  # #       end 


		# # it "returns a committee's schedule B data by purpose" do

  # #       end 


  # #       it "returns a committee's schedule B data by recipient" do

  # #       end 


  # #       it "returns a committee's schedule B data by recipient id" do

  # #       end 


  # #       it "returns a committee's schedule B data by candidate" do

  # #       end 


  #       it "returns all schedule E data in json format" do
  #         @schedules = OpenFec::Schedule.new
  #         response = @schedules.e_all
  #         #response = OpenFec::Schedule.e_all
  #         #pp response.summary
  #         expect(response).to be_kind_of(OpenFec::Schedule_Response)
  #       end 

      # context 'by contributor' do

      # end

      it 'returns total when calling candidate by size for a given cycle ' do
        options = {'candidate_id' => 'S4PA00121' , 'cycle' => 2016 }
        a_by_size_response = OpenFec::Schedule.a_by_size_and_candidate(options)
        @size_hash = a_by_size_response.by_size
      
        expect(@size_hash["total"]).to eq("3541911.05")
      end

      it 'returns candidate by size for a given cycle ' do
        options = {'candidate_id' => 'S4PA00121' , 'cycle' => '2016' }
        a_by_size_response = OpenFec::Schedule.a_by_size_and_candidate(options)
        @size_hash = a_by_size_response.by_size
        expect(@size_hash["1000"].to_s).to eq("671405.96")
      end

      # it 'returns candidate by contributor type for a given cycle ' do
      #   options = {'candidate_id' => 'S4PA00121' , 'cycle' => '2016' }
      #   a_by_type_response = OpenFec::Schedule.a_by_contributor_type_and_candidate(options)
      #   @type_hash = a_by_type_response.by_contributor_type
      #   puts @type_hash['committee-percent']
      #   expect(@type_hash["committee"]).to eq("4920500.34")
      # end

      # it 'return percentages of out-of-state donations for a given candidate' do
      #   options = {'candidate_id' => 'S4PA00121' , 'cycle' => '2016' }
      #   a_by_state_response = OpenFec::Schedule.a_by_state_and_candidate(options)
      #   @state_hash = a_by_state_response.by_state('PA')
      #   puts @state_hash['outside-percent']
      #   expect(@state_hash["home-contribution"]).to eq("1865213.3")
      # end

      end #context "when Configured"
    end #describe schedule
  end #Rspec.describe
end #OpenFec
