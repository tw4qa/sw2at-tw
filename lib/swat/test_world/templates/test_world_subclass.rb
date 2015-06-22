require 'sw2at-tw'
require 'timecop'

# Instance of this class will be available as @tw variable inside of RSpec context

class TwSubclass < Swat::TestWorld::Base
# You can include your own modules here

  # Define your options and situation below
  BASE_OPTIONS = {}
  DEFAULT_OPTIONS = {}
  SITUATIONS = {}

  def init_situation
    # implement your situations
  end

  def before_each(example, context)
    # do something
  end

  def after_each(example, context)
    # do something
  end

end
