module Swat
  module TestWorld
    module RspecSetup

      def init_tw(options = TestWorld.config.klass::BASE_OPTIONS)
        before(:each) do |example|
          Timecop.travel( TestWorld.config.klass.moment ) if TestWorld.config.klass.moment
          TestWorld.config.klass
          @tw = TestWorld.config.klass.new(options)
          @tw.before_each(example, self)
        end

        after(:each) do |example|
          @tw.after_each(example, self)
          Timecop.return
        end
      end

    end
  end
end
