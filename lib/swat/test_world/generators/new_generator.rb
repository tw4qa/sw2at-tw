require 'rails/generators'

module Swat
  module TestWorld
    module Generators
      class NewGenerator < ::Rails::Generators::NamedBase
        source_root File.expand_path('../../templates', __FILE__)

        desc 'Generates Test World files'
        def create_tw
          file = "lib/swat/#{name}.rb"
          template 'test_world_subclass.rb', file
          gsub_file file, 'TwSubclass' do
            name.camelize
          end
        end
      end
    end
  end
end
