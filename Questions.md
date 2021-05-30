why are we using class methods for kpi, instance method for contact -- name method, and scope methods for everything else. Why couldnt' we have just done an instance method for all of them? 



<% if current_user.id == account.user_id %>  why do we need this for the account index list, but not any of the other ones? 



.build vs .new 
does .build create a parent_id. i've read that it used to be necessary in earlier versions of rails for has_many/belongs_to associations, but is not the case anymore and new does the same thing. 


should the accounts_controller have a user_id in the account params method. in what situations would i need to have this there? 








1. can't change color of button text/can't remove text-decoration with bootstrap or unique css
2. many of the functions of the create pages are not creating objects 
3. connections db (what should be in there)
	a. i want the dates to show up automatically
	b. i want the contacts to come from a drop-down
	c. i want the products to come from a drop-down

4. contacts page can't create because "account must exist"

5. i want to make the div a link --- dashboard quick links

6. can't get hover to wokr on navbar and going to add active link, but i assume i'll get the same problem


<%= page_state(dashboards_path) %>"


Add KPI table 

calls 
opportunities created 
new accounts created
income goal 
projected income
signed contracts

Tasks table 
Date
Contact Id
Notes 
Account Id 

views dashboard and account page 
can 

Things to fix 
can't edit tasks
when editing a connection, i can't turn into an opportunity. want to remove the opportunity check box for existing connections
