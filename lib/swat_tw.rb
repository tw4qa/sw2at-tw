module Swat
  module TestWorld
    require 'swat/test_world/base'
    require 'swat/test_world/config'


    def self.setup(rspec_config, opts)
      @config = Config.new(rspec_config, opts)
    end

    def self.config
      @config
    end

  end
end
