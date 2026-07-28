Feature: Create a Comapany with all required details

  Background:

#    * def reqBody =
#    """
#    {
#        "email": "rohith+pfaadmin@coreaiconsulting.com",
#        "password": "test1234",
#        "device_id": "PFA-device-540"
#    }
#    """



#    Given url 'https://devapi.suretyforce.com/apim'
#    And path '/api/auth/userlogin'
#    And request reqBody
#    When method POST
#    Then status 200
#    And print response
#    * def token = response.token
#    * def tenantId = response.payload.user.tenant_id.id
#
#    And print tenantId

 * def randomNumber = Math.floor(Math.random()*1000000)

 * def loginResponse = callonce read('classpath:features/auth/Login.feature')

 * print loginResponse

 * def token = loginResponse.token
 * def tenantId = loginResponse.tenantId



  Scenario: Create a company by passing Auth Token and Fetch By its id

    * def companyName = 'Pandit Trucking service ' + randomNumber

    * def requestBodyForCompany =
    """
    {
      "name": "#(companyName)",
      "dba_name": "PTS",
      "business_type": "LLC",
      "federal_tax_id": "#(randomNumber)",
      "mcNumber": "#(randomNumber)",
      "statistics_info": "Helps to move your packages safely",
      "dot_number": "#(randomNumber)",
      "phoneNumber": "+1-602-555-21785",
      "source": "Partner Referral",
      "status": "LEAD",
      "addressId": "a41e8209-2a6f-4ada-b31a-dbba612c8919"
    }
    """


    Given url 'https://devapi.suretyforce.com/apim'
    And path '/lead/api/companies'
    And header Authorization = 'Bearer ' + token
    And header X-Tenant-ID = tenantId
    And request requestBodyForCompany
    When method POST
    Then status 201
    And print response
    * def companyId = response.id
    And print companyId


    * def pathParam = '/lead/api/companies/' + companyId

    Given url 'https://devapi.suretyforce.com/apim'
      And path pathParam
      And header Authorization = 'Bearer ' + token
      And header X-Tenant-ID = tenantId
      When method GET
      Then status 200
      And print response
#      And match response contains requestBodyForCompany

    * def pathParam = '/lead/api/companies/search'

    Given url 'https://devapi.suretyforce.com/apim'
    And path pathParam
    And param id = companyId
    And header Authorization = 'Bearer ' + token
    And header X-Tenant-ID = tenantId
    When method GET
    Then status 200
    And print response
    * def fetchCompanyId = response.content[0].id

    And match fetchCompanyId == companyId


    ## Update Comany Details

    * def updateCompanyName = 'Test Trucking Company ' + randomNumber

#    * def phoneNumberGenerate = Math.floor(1000000000 + Math.random()* 9000000000)
    * def phoneNumberGenerate = Math.floor( Math.random()* 1000000000)

    * def updateComapnyRequestBody =
    """
    {
        "name" : "#(updateCompanyName)",
        "phoneNumber" : "#(phoneNumberGenerate)"
    }
    """

    Given url 'https://devapi.suretyforce.com/apim'
    And path '/lead/api/companies'
    And path companyId
    And request updateComapnyRequestBody
    And header Authorization = 'Bearer ' + token
    And header X-Tenant-ID = tenantId
    When method PUT
    Then status 200
    And print response


     ## Search for pHone nUmber
    Given url 'https://devapi.suretyforce.com/apim'
    And path pathParam
    And param phoneNumber = phoneNumberGenerate
    And header Authorization = 'Bearer ' + token
    And header X-Tenant-ID = tenantId
    When method GET
    Then status 200
    And print response
    And match response.content[0].phoneNumber == '#string'

    ## Delete Company ID

    Given url 'https://devapi.suretyforce.com/apim'
    And path 'lead','api','companies', companyId
    And header Authorization = 'Bearer ' + token
    And header X-Tenant-ID = tenantId
    When method DELETE
    Then status 204
    And print response

    ## Search for Company ID To verify its record deleted or not
        Given url 'https://devapi.suretyforce.com/apim'
        And path pathParam
        And param id = companyId
        And header Authorization = 'Bearer ' + token
        And header X-Tenant-ID = tenantId
        When method GET
        Then status 200
        And print response














