# This is a Rails app and we want to load all the files in the app 
# when running this code.  To do so, your current working directory
# should be the top-level directory (i.e. /workspace/your-app/) and then run:
# rails runner labs/3-associations.rb

# **************************
# DON'T CHANGE OR MOVE
Activity.destroy_all
# **************************

# Lab 3: Associations
# - We've added data into the contacts table.  Next, we'll add data
#   into the activities table.  Follow the steps below to insert
#   activity data in the database.  Afterwards, display a
#   single salesperson's activity data:

# 1. insert 3 rows in the activities table with relationships to
# a single salesperson and 2 different contacts

puts "Activities: #{Activity.all.count}"

# query to find a salesperson row in the salespeople table
# find salesperson
ben = Salesperson.find_by({"first_name" => "Ben", "last_name" => "Block"})

# query to find a contact row in the contacts table
# find contact
cook = Contact.find_by({"first_name" => "Tim", "last_name" => "Cook"})
craig = Contact.find_by({"first_name" => "Craig", "last_name" => "Fredrick"})

# Activity.new
activity = Activity.new
# assign new activity salesperson_id to salesperson
activity["salesperson_id"] = ben["id"]
# assign new activity contact_id to contact
activity["contact_id"] = cook["id"]
# assign the activity notes
activity["notes"] = "quick check-in over facetime"
# save new activity
activity.save

activity = Activity.new
activity["salesperson_id"] = ben["id"]
activity["contact_id"] = cook["id"]
activity["notes"] = "met at Cupertino"
activity.save

# query to find a contact row in the contacts table
bezos = Contact.find_by({"first_name" => "Jeff", "last_name" => "Bezos"})

activity = Activity.new
activity["salesperson_id"] = ben["id"]
activity["contact_id"] = bezos["id"]
activity["notes"] = "met at Blue Origin HQ"
activity.save

puts "Activities: #{Activity.all.count}"

# 2. Display all the activities between the salesperson used above
# and one of the contacts (sample output below):

# ---------------------------------
puts "Activities between Ben and Tim Cook:"
# - quick checkin over facetime
# - met at Cupertino

# query to find activity rows associated to salesperson Ben and contact Tim Cook
activities = Activity.where({"salesperson_id" => ben["id"], "contact_id" => cook["id"]})

for activity in activities
    # read the note column from the row
    note = activity["notes"]
    # display a string with the note
    puts "- #{note}"
end


# CHALLENGE:
# 3. Similar to above, but display all of the activities for the salesperson
# across all contacts (sample output below):

# ---------------------------------
# Ben's Activities:
# Tim Cook - quick checkin over facetime
# Tim Cook - met at Cupertino
# Jeff Bezos - met at Blue Origin HQ

# 3a. Can you include the contact's company?

# ---------------------------------
# Ben's Activities:
# Tim Cook (Apple) - quick checkin over facetime
# Tim Cook (Apple) - met at Cupertino
# Jeff Bezos (Amazon) - met at Blue Origin HQ

# CHALLENGE:
# 4. How many activities does each salesperson have?

# ---------------------------------
# Ben Block: 3 activities
# Brian Eng: 0 activities
