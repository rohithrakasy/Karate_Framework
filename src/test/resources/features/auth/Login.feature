   Feature: Constructing a Reusable Login Api file, to fetch access for rest of the api

     Scenario: Login and return auth details

       * def requestBody =
       """
       {
            "email" : "#(userName)",
            "password" : "#(password)",
            "device_id" : "#(deviceID)"
       }
       """
       Given url baseUrl
       And path '/api/auth/userlogin'
       And request requestBody
       When method post
       Then status 200
       And print response

       * def token = response.token
       * def tenantId = response.payload.user.tenant_id.id

       * print tenantId

       * def auth =
       """
       {
            token: '#(token)',
            tenantId: '#(tenantId)'
       }
       """