Feature: Validate all Data types in Karate
  Scenario: Print all data types
    * def name = 'Rohith'
    * def age = 18
    * def city = 'Phoenix'
    * def isVerified = true
    * def studies =
    """
    [
        '10th','Under Grad','Masters'
    ]
    """

    * def emp =
    """
    [

        {    company : 'Infosys',
            year : '2020 - 2023 '
        },
        {
            company : 'Coreai consulting',
            year : '2025 - 2026 '
        }
    ]
    """

    * def fName = 'rohith'
    * def lName = 'r'
    * def fullName = fName+lName

    * print fullName

  * print city

  * print emp[1].year


  Scenario: Generate Some randomw emails
    * def random = Math.floor(Math.random()*1000)
    * def email = 'rohithr'+random+'@gmail.com'

    * print email

  Scenario: Print Time stamp
    * def time = new Date().getTime(
    * print time
