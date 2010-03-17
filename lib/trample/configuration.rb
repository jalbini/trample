module Trample
  class Configuration
    attr_reader :pages

    def initialize(&block)
      @pages = []
      instance_eval(&block)
    end

    def concurrency(*value)
      @concurrency = value.first unless value.empty?
      @concurrency
    end

    def iterations(*value)
      @iterations = value.first unless value.empty?
      @iterations
    end
    
    def throttle_server_address(*value)
      @throttle_server_address = value.first unless value.empty?
      @throttle_server_address
    end

    def get(url, &block)
      @pages << Page.new(:get, url, block || {})
    end

    def post(url, params = nil, &block)
      @pages << Page.new(:post, url, params || block)
    end

    def login
      if block_given?
        yield
        @login = pages.pop
      end

      @login
    end

    def ==(other)
      other.is_a?(Configuration) &&
        other.pages == pages &&
        other.concurrency == concurrency &&
        other.iterations  == iterations &&
        other.throttle_server_address == throttle_server_address
    end
  end
end
