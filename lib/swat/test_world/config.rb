module Swat
  module TestWorld
    class Config

      DEFAULT_OPTIONS = {
        moment: '2014-10-08 12:30:00 UTC'
      }

      def initialize(opts = {})
        @options = DEFAULT_OPTIONS.merge opts
      end

      def options
        @options
      end

    end
  end
end
