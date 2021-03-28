# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
        # My controllers are all consisting of get, post , patch, and delete methods
- [x] Use ActiveRecord for storing information in a database
        # Controllers are inheriting from the Sinatra Base using Active Record
- [x] Include more than one model class (e.g. User, Post, Category) 
        # I have two model classes; task and user
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts) 
        # User model has_many tasks
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User)
        # Task model belongs_to user
- [x] Include user accounts with unique login attribute (username or email)
        # User's must signup with a unique username
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
        # A user can read, create, edit and delete their own tasks
- [x] Ensure that users can't modify content created by other users
        # Sessions have been enabled so that way a user can only access their own data that they input into the application
- [x] Include user input validations
        # Validates a users username presence and uniqueness
- [ ] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
        # Have not been able to implement this but I plan on doing it in the near future
- [ ] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [x] You have a large number of small Git commits
        # 
- [x] Your commit messages are meaningful
        # Commit messages state clearly what I did regarding adding or editing code
- [x] You made the changes in a commit that relate to the commit message
        # Commit messages appropriately correspond to the changes that were made
- [x] You don't include changes in a commit that aren't related to the commit message
        # In the beggining there were a couple that happened on accident, but I made sure not to do it again as I continued on the project