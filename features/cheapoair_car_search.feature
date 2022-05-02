@car_search
Feature: Car search functionality

  @smoke @jira_34455
  Scenario: verify the user is able to search for the cars availablity
    Given user is on the Cheapoair homepage
    When user search for cars availability for future dates
