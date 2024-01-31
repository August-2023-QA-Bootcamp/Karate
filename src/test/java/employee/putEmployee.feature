@put-employee-feature
Feature: PUT Employee API Validation

  Background: 
    * url baseUrl
    * path endpoint.employeeEndpoint
    * def helper = call read('classpath:helper/helper.feature@get-employees')

  Scenario: PUT API Validation String body
    # get employees api call
    * def ids = karate.jsonPath(helper.response, '$.[*].id')
    # grab ids
    * def id = ids[ids.length-1]
    # grab a id for path variable
    Given path id
    * def employee = {'firstName':'Ramij', 'lastName':'Raja', 'dob':'1980-12-01'}
    And header Content-Type = 'application/json'
    When request employee
    And method PUT
    Then status 200
    
