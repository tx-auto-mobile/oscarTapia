########################################
#                                      #
#       Important Note                 #
#                                      #
#   When running calabash-ios tests at #
#   www.xamarin.com/test-cloud         #
#   this file will be overwritten by   #
#   a file which automates             #
#   app launch on devices.             #
#                                      #
#   Don't rely on this file being      #
#   present when running at            #
#   Xamarin Test Cloud                 #
#                                      #
########################################

require 'calabash-cucumber/launcher'
require_relative '../../ui_elements/mobile_app'
require_relative '../../ui_elements/uielements_getter'
require 'test/unit/assertions'

# ************ IMPORTANT ************* #
# Bundle path - Should be specified the app file of the application that has been build to be launched with Calabash server
APP_BUNDLE_PATH = "/Users/applico-dev/Library/Developer/Xcode/DerivedData/Signal-eorxbgslpdhllhajxvtpomtzutwe/Build/Products/Debug-iphonesimulator/Signal-cal.app"

# You may uncomment the above to overwrite the APP_BUNDLE_PATH
# However the recommended approach is to let Calabash find the app itself
# or set the environment variable APP_BUNDLE_PATH

World(Test::Unit::Assertions)

Before do |scenario|
  @calabash_launcher = Calabash::Cucumber::Launcher.new
  unless @calabash_launcher.calabash_no_launch?
    @calabash_launcher.relaunch
    @calabash_launcher.calabash_notify(self)
  end

  #Creates an instance for the usage of methods through all project
  @mobile_application = MobileAppPage.instance
  @uielement = @mobile_application.uielement
end

# After do |scenario|
#   unless @calabash_launcher.calabash_no_stop?
#     calabash_exit
#     if @calabash_launcher.active?
#       @calabash_launcher.stop
#     end
#   end
# end
#
#
# at_exit do
#   launcher = Calabash::Cucumber::Launcher.new
#   if launcher.simulator_target?
#     Calabash::Cucumber::SimulatorHelper.stop unless launcher.calabash_no_stop?
#   end
# end
