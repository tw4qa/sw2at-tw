module Swat
  module TestWorld
    class Base
      BASE_OPTIONS = {}
      DEFAULT_OPTIONS = {}
      SITUATIONS = {}

      attr_reader :options

      def initialize(opts = {})
        @options = init_options(opts)
        init_situation
      end

      def self.moment
        m = TestWorld.config.options[:moment]
        m.is_a?(Time) ? m : Time.parse(m.to_s)
      end

      def moment
        self.class.moment
      end

      alias_method :now, :moment

      protected

      def base_options
        self.class::BASE_OPTIONS
      end

      def default_options
        self.class::DEFAULT_OPTIONS
      end

      def situations
        self.class::SITUATIONS
      end

      def init_situation
        raise 'method "init_situation" should be implemented in subclass'
      end

      def self.before_each(context)
        #can be implemented in subclass
      end

      def self.after_each(context)
        #can be implemented in subclass
      end

      private

      def init_options(opts)
        res = if opts.is_a?(Hash)
          default_options.merge(opts)
        elsif opts.is_a?(Symbol)
          default_options.merge(situations[opts])
        else
          raise 'Invalid TW options passed! should be Hash or Symbol(situation identifier)'
        end
        base_options.merge res
      end

    end
  end
end
