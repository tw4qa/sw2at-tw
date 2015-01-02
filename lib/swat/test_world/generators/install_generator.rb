require 'rails/generators'

module Swat
  module TestWorld
    module Generators
      class InstallGenerator < ::Rails::Generators::NamedBase
        source_root File.expand_path('../../templates', __FILE__)

        desc 'Generates Test World files'
        def install
          create_tw
          if ENV['with_modules']
            create_helpers
            create_methods
            gsub_file main_file, '# You can include your own modules here' do
              <<MODULES
    require 'swat/modules/helpers.rb'
    require 'swat/modules/methods.rb'
    include Methods
MODULES
            end
          end
        end

        private
        def create_tw
          template 'test_world_subclass.rb', main_file
          swat_gsub main_file
        end

        def create_helpers
          file = 'lib/swat/modules/helpers.rb'
          template 'helpers.rb', file
          swat_gsub file
        end

        def create_methods
          file = 'lib/swat/modules/methods.rb'
          template 'methods.rb', file
          swat_gsub file
        end

        def swat_gsub file
          gsub_file file, 'TwSubclass' do
            name.camelize
          end
        end

        def main_file
          "lib/swat/#{name}.rb"
        end
      end
    end
  end
end
