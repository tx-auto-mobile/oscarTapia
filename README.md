# oscarTapia
# Cucumber-Ruby-Calabash automation project

This project is an example of automation mobile for iOS applications, using cucumber to write the test cases in plain
text, ruby as the language used to interect with calabash libraries, and Calabash server to launch the app to allow
the execution of the automated test cases.

#Documentation
Please refer to the automation guide document: CalabashCucumberRubyAutomation.docx

#Usage
To run this sample project:
1. Change the APP_BUNDLE_PATH variable located in the launch.rb file to point to your iOS app that has been built
using calabash.framework.
2. Navigate to the automation project, then from console type:
   cucumber -p all-tests
   This will launch the iOS simulator to execute the test cases
3. Once execution finishes, type this in console to create the report:
   mvn install
   mvn exec:java
4. Navigate to ReportHTMLResults folder, then open the feature-overview.html file to see the execution report of the
automation.
