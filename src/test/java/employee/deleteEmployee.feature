@delete-employee-feature
Feature: DELETE Employee API Validation

  Background: 
    * url baseUrl
    * path endpoint.employeeEndpoint
    * def helper = call read('classpath:helper/helper.feature@get-employees')

  #* def pathFun = call read('classpath:helper/constructPath.js')
  Scenario: DELETE Employee API - Validation
    # get employees api call
    * def ids = karate.jsonPath(helper.response, '$.[*].id')
    # grab ids
    * def id = ids[ids.length-1] 
    # grab a id for path variable
    Given path id
    # assign path variable
    When method DELETE
    # status validation
    Then status 200
		# get employees api call
		* def helper2 = call read('classpath:helper/helper.feature@get-employees')
		# grab ids
		* def afterIds = karate.jsonPath(helper2.response, '$.[*].id')
		# validate the id that has been deleted not present
		* print afterIds.length
		* print ids.length
		* assert afterIds.length < ids.length
