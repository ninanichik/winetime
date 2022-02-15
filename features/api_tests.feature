@api
Feature: API tests

  Scenario: Get all users
    When GET request is sent to users
    Then response with list of users should be provided
    And status code is '200'

  Scenario: Get all wines
    When GET request is sent to wines
    Then response with list of wines should be provided
    And status code is '200'

  Scenario: Get wine by id
    When GET request is sent to wine
    Then response with one wine should be provided
    And status code is '200'

  Scenario: Delete wine
    When DELETE request is sent to wine
    Then response should be empty
    And status code is '204'
    And user should be redirected to wines list

  Scenario Outline: Add a new wine
    When POST request is sent to add new wine with <name>, <wine_variety>, <produced_year>, <produced_place>
    Then response with new wine should be provided
    And status code is '201'
    Examples:
      | name    | wine_variety | produced_year | produced_place |
      | My wine | semi-sweet   | 2001          | Italy          |

  Scenario Outline: Update an existing wine
    #Given POST request is sent to add new wine with <name>, <wine_variety>, <produced_year>, <produced_place>
    When PUT request is sent to add new wine by <id> with <name>, <wine_variety>, <produced_year>, <produced_place>
    Then response with new wine should be provided
    And status code is '202'
    Examples:
      | id | name        | wine_variety | produced_year | produced_place |
      | 2  | My wine new | semi-sweet   | 2002          | France         |

# negative scenarios

  Scenario: Get wine by invalid id
    When GET request is sent to wine
    Then error message should be provided
    And status code is '400'

  Scenario: Add a new wine without required params
    When POST request is sent to add new wine with incorrect params
    Then error message should be provided
    And status code is '404'