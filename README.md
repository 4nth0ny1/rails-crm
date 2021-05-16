
**secondary tasks

User class

	Create Sales Rep 
	Name 
	email
	create an account 

Account class - from here the user can CRUD contacts, opportunities, company information, and log connections
		has_many contacts, through account_contacts
		has_many opportunities
		belongs_to user

	Company name
	Address
	Phone 
	User_id
	Log a Connection (drop-down of calls, emails, research, plus notes section)
	**Products bought List
	**Time in state

Opportunity - When a sales rep makes a connection and has a conversation about a certain product.
	belongs_to account
	has_many opportunity_contacts

	Products
	Contacts    
	Account_ID
	**time in state
	**value of opportunities

Account and Contact Join Table needed (account_contacts is the name of the table)
	belongs_to account
	belongs_to contact

	contact_id
	account_id
 
Opportunity and Contact Table (opportunity_contacts is the name of the table)
	belongs_to opportunity
	belongs_to contact

	opportunity_id
	contact_id 
	Log a Connection (drop-down of calls, emails, research, plus notes section)

Contact
	belongs_to account
	has_many opportunity_contacts
		
	First Name 
	Last Name 
	Phone 
	email 
	Role
	Account_id

Product

	title
	description
	product_number
	price

** Dashboard - the dash board will act as a hub for organizing the day. 

	Accounts with Opportunities (last connection)
	Accounts with no Opportunities (last connection)
	Latest Opportunities
	**Oldest Leads
	**Oldest Accounts 

