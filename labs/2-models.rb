# This is a Rails app and we want to load all the files in the app 
# when running this code.  To do so, your current working directory
# should be the top-level directory (i.e. /workspace/your-app/) and then run:
# rails runner labs/2-models.rb

# **************************
# DON'T CHANGE OR MOVE
Salesperson.destroy_all
# **************************

# Lab 2: Models
# - We've added data into the companies table.  Next, we'll add data
#   into the salespeople table.  Follow the steps below to insert and
#   read rows of salesperson data.  Update a row.  Afterwards, display
#   how many rows have been inserted into the salespeople table.
#   Lastly, if you want a challenge, try writing code to display the
#   full name of each salesperson.

# 1a. check out the schema file
# 1b. check out the model file

puts "There are #{Salesperson.all.count} salespeople"

# 2. insert 1-2 rows in salespeople table.

# initialize a new empty row (aka Hash) in the salespeople table
salesperson = Salesperson.new

# assign values to the columns (aka keys) in the row (aka Hash)
salesperson["first_name"] = "Ben"
salesperson["last_name"] = "Block"
salesperson["email"] = "block@hey.com"

# insert (aka save) the row into the table
salesperson.save

# repeat for another salesperson
salesperson = Salesperson.new
salesperson["first_name"] = "Brian"
salesperson["last_name"] = "Eng"
salesperson["email"] = "eng@hey.com"
salesperson.save

salesperson = Salesperson.new
salesperson["first_name"] = "Anthony"
salesperson["last_name"] = "Yoyo"
salesperson["email"] = "yoyo@hey.com"
salesperson.save

# 3. write code to display how many salespeople rows are in the database

# ---------------------------------
# Salespeople: 2

puts "There are #{Salesperson.all.count} salespeople"

# 4. modify/update column data for a row in the salespeople table.

ben = Salesperson.find_by({"first_name" => "Ben", "last_name" => "Block"})
# puts ben.inspect
ben["email"] = "bjblock@gmail.com"
ben.save

# CHALLENGE:
# 5. write code to display each salesperson's full name

# ---------------------------------
# Salespeople: 2
# puts "There are #{Salesperson.all.count} salespeople"

salespeople = Salesperson.all

for person in salespeople

    # Ben Block
    # Brian Eng
    first_name = person["first_name"]
    last_name = person["last_name"]
    puts "#{first_name} #{last_name}"

end
