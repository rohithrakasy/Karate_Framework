Feature: Use Background concept for re useability
  Background:
    * url 'https://jsonplaceholder.typicode.com'


  Scenario: Create a POst Request
    * def req =
    """
    {
        title: 'Test creation for background',
        body: 'Test for post',
        userId: 2
    }
    """
    Given path '/posts'
    And request req
    When method POST
    Then status 201
    And print response
    And match response.userId == req.userId
    And match response contains req