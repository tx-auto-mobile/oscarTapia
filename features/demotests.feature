Feature: Signal automation demo tests

  Scenario: As a tester, I want to verify that correct registered number is displayed
    Given I am in main view
    And I tap on "settings" button
    And I see the "Registered Number:" element
    Then the number "+591 71726255" should be displayed

  Scenario: As a tester, I want to verify that the status is Connected
    Given I am in main view
    And I tap on "settings" button
    And I see the "Network Status" element
    Then I should see "Connected" message

    @bvt
  Scenario: As a tester, I want to verify that Enable screen can be activated
    Given I am in main view
    And I tap on "settings" button
    And I tap on "Privacy" element
    And I tap on "Enable Screen Security" switch
    And "Enable Screen Security" switch should have value "1"

    @bvt
  Scenario: As a tester, I want to verify that Enable screen can be deactivated
    Given I am in main view
    And I tap on "settings" button
    And I tap on "Privacy" element
    And I tap on "Enable Screen Security" switch
    And "Enable Screen Security" switch should have value "0"

  Scenario: As a tester, I want to verify that Clear History Logs option opens a confirmation dialog
    Given I am in main view
    And I tap on "settings" button
    And I tap on "Privacy" element
    And I tap on "Clear History Logs" element
    Then I should see "Are you sure you want to delete all your history (messages, attachments, call history ...) ? This action cannot be reverted." message

  Scenario: As a tester, I want to verify that I'm sure option deletes the history
    Given I am in main view
    And I tap on "settings" button
    And I tap on "Privacy" element
    And I tap on "Clear History Logs" element
    Then I should see "Are you sure you want to delete all your history (messages, attachments, call history ...) ? This action cannot be reverted." message
    And I touch on "I'm sure." button
    Then I should not see the "Are you sure you want to delete all your history (messages, attachments, call history ...) ? This action cannot be reverted." popup anymore

  Scenario: As a tester, I want to verify that Cancel does not delete the history and return to app screen
    Given I am in main view
    And I tap on "settings" button
    And I tap on "Privacy" element
    And I tap on "Clear History Logs" element
    Then I should see "Are you sure you want to delete all your history (messages, attachments, call history ...) ? This action cannot be reverted." message
    Then I tap on "Cancel" element
    Then I should not see the "Are you sure you want to delete all your history (messages, attachments, call history ...) ? This action cannot be reverted." popup anymore

  Scenario: As a tester, I want to verify that Cancel does not delete the history and return to app screen
    Given I am in main view
    And I tap on "settings" button
    And I tap on "About" element
    And I see the "Version" element
    And I should see "2.3" message




