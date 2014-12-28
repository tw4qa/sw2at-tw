module Swat
  module TestWorld
    module RspecSetup

      def init_tw(options = TestWorld.config.klass::BASE_OPTIONS)
        before(:each) do |context|
          Timecop.travel( TestWorld.config.klass.moment )
          TestWorld.config.klass.before_each(context)
          @tw = TestWorld.config.klass.new(options)
        end

        after(:each) do |context|
          TestWorld.config.klass.after_each(context)
          Timecop.return
        end

        def tw
          @tw
        end
      end

    end
  end
end
