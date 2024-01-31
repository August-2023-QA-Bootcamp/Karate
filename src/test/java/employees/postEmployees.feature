@post-employees-feature
Feature: POST Employees API validation

  Background: 
    * url baseUrl
    * path endpoint.employeesEndpoint
    * def employee = read('classpath:employees/employee.json')
    * def schema = call read('classpath:helper/sample.js')

	@scenario-outline
  Scenario Outline: POST Call with JSON file
    Given header Content-Type = <contentType>
    And set employee.firstName = <firstName>
    And set employee.lastName = <lastName>
    And set employee.dob = <dob>
    # * def employee = {'fistName':'Ramij', 'lastName':'Raja', 'dob':'1980-12-01'}
    And request employee
    When method POST
    Then status 201
    
    * match response == schema.employeeSchema
    
    * def fun =
      """
      function(i){
      	var isEqual = (response[i] == schema.employeeSchema);
      	print(response[i].age);
      	return isEqual;
      }
      """
    
    Given path endpoint.employeesEndpoint
    When method GET
    Then status 200
    
    * karate.repeat(response.length, fun)
    
    * def firstName1 = response[response.length - 1].firstName
    * match firstName1 == <firstName>
    * def lastName1 = response[response.length - 1].lastName
    * match lastName1 == <lastName>
    * def dob1 = response[response.length - 1].dob
    * match dob1 == <dob>

    Examples: 
      | contentType        | firstName  | lastName    | dob          |
      | 'application/json' | 'Sachin'   | 'Tendulkar' | '1990-02-13' |
      | 'application/json' | 'KL'       | 'Rahul'     | '2000-12-30' |
      | 'application/json' | 'Musfiqur' | 'Rahim'     | '2001-10-20' |
