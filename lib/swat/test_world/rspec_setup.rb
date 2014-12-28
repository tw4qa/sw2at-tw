module Swat
  module TestWorld
    module RspecSetup

      def init_tw(options = BASE_OPTIONS)
        before(:each) do
          Timecop.travel( TestWorld.config.klass.moment )
          @tw = TestWorld.config.klass.new(options)
        end

        after(:each) do
          Timecop.return
        end
      end

    end
  end
end
