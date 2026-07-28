Feature: Create CRUD operations for principal's end points

  Background:

    * def loginResponse = callonce read('classpath:features/auth/UserLogin.feature')
    * print loginResponse

    * def token = loginResponse.token
    * def tenantId = loginResponse.tenantId

    * def randomNumber = Math.floor(Math.random() * 10000000000)

  Scenario: Create a Principal using post Http Request

    * def firstName = 'Test Karate' + randomNumber
    * def lastName = 'test'+ randomNumber
    * def email = 'harshith+'+ randomNumber+'@coreaiconsulting.com'



    * def principalPayload =
    """
    {
        "firstName": "#(firstName)",
        "lastName": "#(lastName)",
        "email": "#(email)",
        "phoneNumber": "1112223698"
    }
    """

    Given url baseUrl
    And path '/lead/api/principals'
    And request principalPayload
    And header Authorization = 'Bearer ' + token
    And header X-Tenant-ID = tenantId
    When method POST
    Then status 200
    And print response

    * def principalId = response.id
    * print principalId
