module OpenFec
  class Schedule_Response < Response
		attr_reader :pagination, :results

  	def initialize(response)
      @pagination = response["pagination"]
      @results = response["results"]
    end

    def request_query
      request.options[:query]
    end

    # def limit
    #   headers["x-ratelimit-limit"].to_i
    # end

    # def remaining
    #   headers["x-ratelimit-remaining"].to_i
    # end

    def page
      pagination["page"].to_i
    end

    def pages
      pagination["pages"].to_i
    end

    def results_count
      results.count
    end

    def first_result_name
      results.first["name"]
    end

    def last_result_name
      results.last["name"]
    end

    def summary
      @results.count
    end

    def by_size
      #return hash of candidate's schedule A contributions by size.
      @contributions = {}
      percentages = {}
      total = 0
      @results.each do |r|
        total += r['total']
        @contributions[ r['size'].to_s ] = r['total']
      end
      @contributions.each do |k, v|
        percentages[k + '-percent'] = (@contributions[k] / total).round(4)
      end
      @contributions.merge!(percentages)
      @contributions['total'] = total.round(2).to_s
      return @contributions
    end

    def by_contributor_type
      #total
      #individual amount
      #individual percentage
      #committee amount
      #committe percentage
      @contributions = {}
      total = 0
      @results.each do |r|
        total += r["total"]
        if r["individual"]
          @contributions['individual'] = r["total"]
        else
          @contributions['committee'] = r["total"]
        end
      end
      @contributions['individual-percent'] = (@contributions['individual'] / total).round(4)
      @contributions['committee-percent'] = (@contributions['committee'] / total).round(4)
      @contributions['total'] = total.to_s
      return @contributions
    end

    def by_state(home_state)
      @contributions = {}
      total = 0
      outside_contrib = 0
      @results.each do |r|
        total += r['total']
        if r['state'] == home_state
          @contributions['home-contribution'] = r['total']
        end
      end
      @contributions['outside-contribution'] = total - @contributions['home-contribution']
      @contributions['home-percent'] = (@contributions['home-contribution'] / total).round(4)
      @contributions['outside-percent'] = (@contributions['outside-contribution'] / total).round(4)
      @contributions['total'] = total
      return @contributions
    end


  end #class schedule_response
end #module OpenFec