# Write your sql queries in this file in the appropriate method like the example below:
#
# def select_category_from_projects
# "SELECT category FROM projects;"
# end

# Make sure each ruby method returns a string containing a valid SQL statement.


# CREATE TABLE projects (
# id INTEGER PRIMARY KEY,
# title TEXT, 
# category TEXT,
# funding_goal INTEGER,
# start_date TEXT,
# end_date TEXT);


#  CREATE TABLE users (
#   id INTEGER PRIMARY KEY,
#   name TEXT,
#   age INTEGER
#   );


# CREATE TABLE pledges (
# id INTEGER PRIMARY KEY,
# amount INTEGER, 
# user_id INTEGER,
# project_id INTEGER )

def selects_the_titles_of_all_projects_and_their_pledge_amounts
"SELECT projects.title, SUM(pledges.amount) FROM projects JOIN pledges on projects.id = pledges.project_id group by projects.title"
end

def selects_the_user_name_age_and_pledge_amount_for_all_pledges
"SELECT users.name, users.age, SUM(pledges.amount) FROM users JOIN pledges on users.id = pledges.user_id group by users.name"
end

def selects_the_titles_and_amount_over_goal_of_all_projects_that_have_met_their_funding_goal
" SELECT projects.title, SUM(pledges.amount) - projects.funding_goal FROM projects JOIN pledges ON projects.id = pledges.project_id GROUP BY projects.title HAVING SUM(pledges.amount) - projects.funding_goal >= 0;"
end 
def selects_user_names_and_amounts_of_all_pledges_grouped_by_name_then_orders_them_by_the_amount
"SELECT users.name, SUM(pledges.amount) FROM users JOIN pledges on pledges.user_id = users.id group by users.name ORDER BY SUM(pledges.amount)"
end

def selects_the_category_names_and_pledge_amounts_of_all_pledges_in_the_music_category
"SELECT projects.category, pledges.amount FROM projects JOIN pledges ON projects.id = pledges.project_id WHERE projects.category = 'music'"
end

def selects_the_category_name_and_the_sum_total_of_the_all_its_pledges_for_the_book_category
"SELECT projects.category, SUM(pledges.amount) FROM projects JOIN pledges ON projects.id = pledges.project_id WHERE projects.category = 'books' "
end
