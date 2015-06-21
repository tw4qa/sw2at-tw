module Swat
  module TestWorld
    require 'swat/test_world/base'
    require 'swat/test_world/rspec_setup'

    class Config

      class EmptyTestWorld < TestWorld::Base
        def init_situation; end
      end

      DEFAULT_OPTIONS = {
        moment: '2014-10-08 12:30:00 UTC',
        klass: EmptyTestWorld,
      }

      def initialize(rspec_config, opts = {})
        @options = DEFAULT_OPTIONS.merge opts
        rspec_config.extend RspecSetup
        rspec_config.include klass::Helpers if defined? klass::Helpers
      end

      def options
        @options
      end

      def klass
        unless options[:klass] < TestWorld::Base
          raise '"klass" should be subclass of TestWorld::Base'
        end
        options[:klass]
      end
    end
  end
end
