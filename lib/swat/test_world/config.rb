module Swat
  module TestWorld
    require 'swat/test_world/base'

    class Config

      DEFAULT_OPTIONS = {
        moment: '2014-10-08 12:30:00 UTC',
        klass: TestWorld::Base,
      }

      def initialize(opts = {})
        @options = DEFAULT_OPTIONS.merge opts
      end

      def options
        @options
      end

      def klass
        unless options[:klass].is_a? TestWorld::Base
          raise '"klass" should be subclass of TestWorld::Base'
        end
        options[:klass]
      end
    end
  end
end
