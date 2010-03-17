module Trample
  class Session
    include Logging
    include Timer

    attr_reader :config, :response_times, :cookies, :last_response, :thread_id

    def self.request_speed
      @@requests_sent / (Time.now - @@start_time)
    end
    
    def self.response_speed
      @@requests_returned / (Time.now - @@start_time)
    end
    
    def self.average_response_time
      @@total_response_time/@@requests_returned
    end
        
    def initialize(config, thread_id)
      @config         = config
      @response_times = []
      @cookies        = {}
      @thread_id      = thread_id
      
      # class variables to gauge speed
      @@start_time          ||= Time.now
      @@requests_sent       ||= 0
      @@requests_returned   ||= 0
      @@total_response_time ||= 0 
    end

    def trample
      hit @config.login unless @config.login.nil?
      @config.iterations.times do
        @config.pages.each do |p|
          hit p
        end
      end
    end

    protected
      def hit(page)
        # start timer and increment sent request count
        start_time = Time.now      
        @@requests_sent += 1
          
        response_times << request(page)
        @cookies = cookies.merge(last_response.cookies)
                
        # increment returned request count
        @@total_response_time += Time.now - start_time
        @@requests_returned += 1
        if rand(5) == 0
          logger.info "Current requests/sec: #{Session.request_speed.truncate}  Current responses/sec: #{Session.response_speed.truncate}  Average response time: " + "%.4f" % Session.average_response_time 
        end
      end

      def request(page)
        time do
          @last_response = send(page.request_method, page)
        end
      end

      def get(page)
        RestClient.get(page.url, :cookies => cookies)
      end

      def post(page)
        RestClient.post(page.url, page.parameters, :cookies => cookies)
      end
  end
end
