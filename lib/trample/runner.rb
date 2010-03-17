module Trample
  class Runner
    include Logging

    attr_reader :config, :threads, :requests_fired

    def initialize(config)
      @config  = config
      @threads = []
    end

    def trample
      logger.info "Starting trample..."

      config.concurrency.times do |id|
        thread = Thread.new(@config, id) do |c, id|
          Session.new(c, id).trample
        end
        threads << thread
      end

      threads.each do |t|
        t.join
      end

      logger.info "Trample completed..."
    end
  end
end

