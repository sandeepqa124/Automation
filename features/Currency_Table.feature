Feature: Test the Currency Table

Scenario: Verify there are five records in Currency table
	Given a user login to application
	When they go to currency page
	Then they see five records in currency table
	
Scenario: Verify all values in currency table are in currency format
	Given a user login to application
	When they go to currency page
	Then they see all the values in currency format
	
Scenario: Verify all values in currency table are greater than 0
	Given a user login to application
	When they go to currency page
	Then they see all the values are greater than 0
	
Scenario: Verify the total balance is correct based on listed values
	Given a user login to application
	When they go to currency page
	Then they see the total balance is sum of all listed values
