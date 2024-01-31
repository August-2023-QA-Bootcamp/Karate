@exclude
Feature: Helper feature

  Background: 
    * url baseUrl

  @get-employees
  Scenario: GET Employees API call
    Given path endpoint.employeesEndpoint
    When method GET
    Then status 200
    
  @delete-employees
  Scenario: DELETE Employees API call
    Given path endpoint.employeesEndpoint
    And path id
    When method DELETE
    Then status 200
