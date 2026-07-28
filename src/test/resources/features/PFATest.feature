Feature: Test User Login Functionality and Fetch Some user Details

  Background:
    * def requestBody =
        """
        {
            "email": "rohith@coreaiconsulting.com",
            "password": "test1234",
            "device_id": "PFA-device-540"
        }
        """
    Given url 'https://devapi.suretyforce.com/apim'
    And path '/api/auth/userlogin'
    And request requestBody
    When method POST
    Then status 200
    And print response
    * def token = response.token
    * def userID = response.payload.user.id
    * def tenantId = response.payload.user.tenant_id.id

    * print userID
    * print token




  Scenario: Fetch All Users with Auth Token
    Given url 'https://devapi.suretyforce.com/apim'
    And path '/api/auth/users'
    And header Authorization  = 'Bearer ' + token
    When method GET
    Then status 200
    And print response



