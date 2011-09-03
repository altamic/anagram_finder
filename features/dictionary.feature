Feature: Upload a Dictionary
  In order to have a list of words to anagram
  As a user
  I want to upload a dictionary file and search for anagrams

  Scenario: Creating a dictionary
    Given I am on the homepage
    When I follow "New Dictionary"
    And I attach the file "spec/fixtures/dictionary.txt" to "Dictionary"
    And I press "Upload"
    Then I should see "Dictionary has been uploaded"


  Scenario: Searching an anagram
    Given I am on the homepage
    When I fill in "search" with "spot"
    And I press "Search Anagram"
    Then I should see "post, spot, stop."

