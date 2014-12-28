module Swat
  module TestWorld
    require 'swat/test_world/base'
    require 'swat/test_world/config'
    require 'swat/test_world/rspec_setup'

    mattr_reader :config

    def self.setup(rspec_config, opts)
      @config = Config.new(opts)
      rspec_config.extend RspecSetup
    end

  end
end
