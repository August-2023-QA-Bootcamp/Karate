@get-employees
Feature: GET Employees API validation

  Background: 
    * url baseUrl
    * def schema = read('classpath:helper/schema.json')
    * def jsSchema = call read('classpath:helper/sample.js')

  @regression @smoke
  Scenario: GET Employees API Status Code Validation
    Given path endpoint.employeesEndpoint
    When method GET
    Then status 200
    # in-line js function declaration
    * def fun =
      """
      function(i){
      	var isEqual = (response[i] == schema.employeeSchema);
      	print(response[i].age);
      	return isEqual;
      }
      """
    * karate.repeat(response.length, fun)

  @regression @validation
  Scenario: GET Employees API Response Validation
    Given path endpoint.employeesEndpoint
    When method GET
    Then status 200
    # And print response
    And match response[0].id == 1
    And assert response.length == 3
    * match response[0] == schema.employeeSchema
    * match response[1] == jsSchema.employeeSchema
