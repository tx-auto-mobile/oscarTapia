# This class will start all the libraries required for the automation project

require(File.dirname(__FILE__) + '/../config/configuration_reader')
require_relative '../config/configuration_reader'
require_relative '../ui_elements/uielements_getter'

class MobileAppPage
  include Singleton
  include Calabash::Cucumber::WaitHelpers
  include Calabash::Cucumber::KeyboardHelpers

  attr_reader :configuration
  attr_reader :DEFAULT_WAIT_TIME

  #classes
  attr_reader :uielement

  def initialize
    @configuration = ConfigurationReader.new
    @DEFAULT_WAIT_TIME = (ENV['WAIT_TIMEOUT'] || 30).to_f
  end

#TODO: This method should be improved for the usage of pure iOS elements.
  def waitForElement(type,element)
    wait_for(:timeout => @DEFAULT_WAIT_TIME) { element_exists("webView #{type}:'#{element}'") }
  end

  def uielement
    @uielement = UIElementsGetter.new if @uielement.nil?
    return @uielement
  end
end