
**secondary tasks

User class

	Create Sales Rep 
	Name 
	email
	create an account 

Accounts class - from here the user can CRUD contacts, opportunities, company information, and log connections
		has_many contacts
		has_many opportunities 
		belongs_to user

	Company name
	Address
	Phone, Contacts
	Opportunities_Id
	User_id
	Log a Connection (drop-down of calls, emails, research, plus notes section)
	**Products bought List
	**Time in state

Opportunities - When a sales rep makes a connection and has a conversation about a certain product.
		belongs_to account

	Products of interest
	Contacts involved 
	Account_ID
	**time in state
	**value of opportunities

Contacts 
		belongs_to account
		
	First Name 
	Last Name 
	Phone 
	email 
	Role
	Account_id

** Dashboard - the dash board will act as a hub for organizing the day. 

	Accounts with Opportunities (last connection)
	Accounts with no Opportunities (last connection)
	Latest Opportunities
	**Oldest Leads
	**Oldest Accounts 

