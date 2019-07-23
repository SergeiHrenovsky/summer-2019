require 'gems'

class PathGemDirectory
  def self.fetch_gem_path_directory(name_gem)
    fetcher = new(name_gem)
    fetcher.gem_path_directory
  end

  def initialize(name_gem)
    @name_gem = name_gem
    @gem_path_directory = nil
  end

  def gem_path_directory
    return nil unless validation_source_code_homepage
    @gem_path_directory = validation_source_code_homepage.sub!(%r{http.*com/}, '')
  end

  private

  def fetch_source_code_homepage
    Gems.info(@name_gem)['source_code_uri'] || Gems.info(@name_gem)['homepage_uri']
  end

  def validation_source_code_homepage
    return nil unless fetch_source_code_homepage.include?('://github.com')
    fetch_source_code_homepage
  end
end
