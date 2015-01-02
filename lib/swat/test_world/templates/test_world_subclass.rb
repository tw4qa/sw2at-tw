require 'swat'

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

  def self.before_each(context)
    # do something
  end

  def self.after_each(context)
    # do something
  end

end
