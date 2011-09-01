Feature: Upload a Dictionary
  In order to have a list of words to anagram
  As a user
  I want to upload a dictionary file

  Scenario: Creating a dictionary
    Given I am on the homepage
    When I follow "New Dictionary"
    And I attach 'downloads/dictionary.txt' in 'dictionary'
    And I press 'Upload'
    Then I should see 'Dictionary has been uploaded'

