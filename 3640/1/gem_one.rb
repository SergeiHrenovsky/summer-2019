require_relative 'scraper.rb'

# Class Gem
class GemOne
  attr_reader :name
  def initialize(name)
    @name = name
  end

  def parameters
    @parameters ||= Scraper.fetch_gem_parameters(@name)
  end

  def rating
    @rating ||= parameters.values.sum
  end
end
