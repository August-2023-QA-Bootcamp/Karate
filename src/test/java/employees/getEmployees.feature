@get-employees-feature
Feature: GET Employees API validation

  Background: 
    * url baseUrl
    * path endpoint.employeesEndpoint
    * def schema = read('classpath:employees/schema.json')
    * def jsSchema = call read('classpath:helper/sample.js')
    * def staticJavaObj = Java.type('helper.CommonClass');
    * def nonStaticRef = Java.type('helper.CommonClass');
    * def nonStaticObj = new nonStaticRef();

  @regression @smoke
  Scenario: GET Employees API Status Code Validation
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
    * print staticJavaObj.getOS()
    * print nonStaticObj.getCurrentDateTime()

  @regression @validation
  Scenario: GET Employees API Response Validation
    When method GET
    Then status 200
    # And print response
    And match response[0].id == 1
    And assert response.length == 3
    * match response[0] == schema.employeeSchema
    * match response[1] == jsSchema.employeeSchema

  @sanity
  Scenario: GET Employees API Response Sanity Validation
    When method GET
    Then status 200
    # And print response
    And match response[0].id == 1
    #And assert response.length == 3
    * match response[0] == schema.employeeSchema
    * match response[1] == jsSchema.employeeSchema
    * def firstNames = $..firstName
    * print firstNames
