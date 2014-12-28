module Swat
  module TestWorld
    require 'swat/test_world/base'
    require 'swat/test_world/config'

    mattr_reader :config

    def setup(opts)
      @config = Config.new(opts)
    end

  end
end
