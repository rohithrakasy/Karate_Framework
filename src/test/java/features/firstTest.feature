Feature: First Api Test

  Scenario: Verify Get API response
    Given url 'https://jsonplaceholder.typicode.com/posts/1'
    When method GET
    Then status 200
    And print response
#    And match response.id == 1
#    And match response.userId == 1
#    And match response.title == 'sunt aut facere repellat provident occaecati excepturi optio reprehenderit'
    And match response ==
            """
            {
                userId: '#number',
                id:'#number',
                title:'#string',
                'body': '#string'
            }
            """
#    And match response contains
#        """
#        {
#            userId: '#number',
#            id:'#number',
#            title:'#string'
#        }
#        """

  Scenario: Create a Post Request
    Given url 'https://jsonplaceholder.typicode.com/posts'
    And request
    """
    {
        'title': 'cReate a Post Request',
        'body': 'Test Post Request',
        userId: 1
    }
    """
    When method POST
    Then status 201
    And print response
#    And match response.userId == 1
    And match response.id == '#number'

  Scenario: Create a post Request using Request body variable
    * def requestBody =
    """
    {
        'title': 'cReate a Post Request',
        'body': 'Test Post Request',
         userId: 1
    }
    """
    Given url 'https://jsonplaceholder.typicode.com/posts'
    And request requestBody
    When method POST
    Then status 201
    And print response
    And match response.userId == requestBody.userId
    And match response contains requestBody


  Scenario: Create a Post Request by utilizing Headers
    * def reqBody =
    """
    {
            'title': 'cReate a Post Request',
            'body': 'Test Post Request',
             userId: 1
    }
    """
    Given url 'https://jsonplaceholder.typicode.com/posts'
    And header Content-Type = 'application/json'
    And header Accept = 'application/json'
    And request reqBody
    When method POST
    Then status 201
    And print response
