module Swat
  module TestWorld
    class Base
      BASE_OPTIONS = {}
      DEFAULT_OPTIONS = {}
      SITUATIONS = {}
      attr_reader :options

      def initialize(opts = {})
        @options = init_options(opts)
        @dumps_directory = "#{Rails.root}/dumps"
        @dumpfile = @dumps_directory + "/#{@situation}.sql"
        @db_config = Rails.application.config.database_configuration['test']
        puts 'start - ' + Time.now.to_i.to_s
        if @situation
          create_or_load_dump
        else
          init_situation
        end
        puts 'load db - ' + Time.now.to_i.to_s
      end

      def self.moment
        m = TestWorld.config.options[:moment]
        return unless m
        m.is_a?(Time) ? m : Time.parse(m.to_s)
      end

      def moment
        self.class.moment
      end

      alias_method :now, :moment

      def before_each(example, context)
        #can be implemented in subclass
      end

      def after_each(example, context)
        #can be implemented in subclass
      end

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

      private

      def init_options(opts)
        res = if opts.is_a?(Hash)
          default_options.merge(opts)
        elsif opts.is_a?(Symbol)
          @situation = opts
          default_options.merge(situations[opts])
        else
          raise 'Invalid TW options passed! should be Hash or Symbol(situation identifier)'
        end
        base_options.merge res
      end

      def create_dump
        unless Dir.exists? @dumps_directory 
           Dir.mkdir @dumps_directory
        end
        system "mysqldump -u #{@db_config['username']} --password=#{@db_config['password']} #{@db_config['database']} > #{@dumpfile}"
      end

      def load_dump
        system "mysql -u #{@db_config['username']} --password=#{@db_config['password']} #{@db_config['database']} < #{@dumpfile}"
      end

      def create_or_load_dump
        if File.exists? @dumpfile
          load_dump
        else
          init_situation
          create_dump
        end
      end
      
    end
  end
end
