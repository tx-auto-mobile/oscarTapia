require 'yaml'

class ConfigurationReader
  @config = nil

private
  def self.loadConfiguration
    @config = YAML.load_file('./config/config.yaml')
  end

  def self.get(key)
    if @config.nil? then
      loadConfiguration
    end
    return @config[key]
  end
end