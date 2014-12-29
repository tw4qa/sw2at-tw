require 'swat'

class TwSubclass < Swat::TestWorld::Base

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
