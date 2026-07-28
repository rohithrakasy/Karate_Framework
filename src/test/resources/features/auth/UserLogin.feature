Feature: Create a resuable Login response

  Scenario: Return Auth Login token and Tenant ID.

    * def requestBody =
    """
    {
        "email": "#(userName)",
        "password": "#(password)",
        "device_id": "#(deviceID)"
    }
    """

    Given url baseUrl
    And path '/api/auth/userlogin'
    And request requestBody
    When method POST
    Then status 200
    And print response

    * def token = response.token
    * def tenantId = response.payload.user.tenant_id.id

    * def authCred =
    """
    {
        token: "#(token)",
        tenantId: "#(tenantId)"
    }
    """

