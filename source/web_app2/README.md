# Rails Programming Task

*Note: This task should take no longer than 4 hours at the most to complete.*

### Prerequisites

- Please note that this will require some basic [Ruby on Rails](http://rubyonrails.org/) and [RSpec](http://rspec.info/) knowledge. 

- You will need to have [Ruby on Rails](http://www.rubyonrails.org/) installed to complete this task. 

## Task

- Fork this repository (if you don't know how to do that, Google is your friend).
- Create a *source* directory.
- In the *source* directory, scaffold a simple Rails 4 web app that models blog app.
- This app has users, stories, and comments. Users have many stories, and each story has many comments.
- JSON structures corresponding to these models are following: 

```
  "user" :  {
    "id": 92,
    "username": "johny",
    "email": "johny@gmail.com",
    "about": "Let others speak for me."
    "first_name": "John",
    "last_name": "Markovich",
    "created_at": 1389618241,
    "updated_at": 1389618241
  }

  "story" :  {
    "id": 10,
    "user_id": 92,
    "active": true,
    "url": "https://blog.heroku.com/archives/2014/2/11/git_push_heroku_master_now_40_faster",
    "title": "Git Push Heroku Master: Now 40% Faster"
    "description": "Flow is an important part of software development.",
    "created_at": 1389618241,
    "updated_at": 1389618241
  }

  "comments" :  {
    "id": 9923,
    "story_id": 10,
    "user_id": 92,
    "comment": "This is an amazing story."
    "created_at": 1389618241,
    "updated_at": 1389618241
  }

```

- Scaffold previously defined entities. 


##### Seed 3 Users into the system:

    User 1:
      Username: johny
      Email: "johny@gmail.com"
      About: "Let others speak for me."
      First Name: John 
      Last Name: Markovich
      
    User 2: 
      Username: ben
      Email: "ben@gmail.com"
      About: "Ooh, I don't know what to say."
      First Name: Ben 
      Last Name: Smith

    User 3: 
      Username: george
      Email: "george@gmail.com"
      About: "I am amazing."
      First Name: George 
      Last Name: Adams

  
##### Seed 12 stories into the system:

    7 Should be active stories:
      - 3 Should be linked to User 1
      - 2 Should be linked to User 2
      - 2 Should be linked to User 3
      
    5 Should be stories that are inactive:
      - 1 should be linked to User 1
      - 2 Should be linked to User 2
      - 3 Should be linked to User 3
    
##### Seed 9 comments into the system:
    
  Repeat following for each user. Only active stories can have comments.

    First story for User n has 1 comment, comment author is User (n+1)%3
    Second story for User n has 2 comments, comment authors are User (n+1)%3 and (n+2)%3
    
##### Create a Visual Representation 1 for each story:

On the view that shows particular story (most likely the *GET /stories/:id* route), beneath story text display list of comments starting with most recent comment at the top. 

##### Create a Visual Representation 2 for each user which will also contain three different lists for user's stories:

  1. List 1
    - Header: Active Stories
    - In this list set the background color of the rows to #0000FF and list the Story title which is linked to the Story url, the number of comments which that story has and the date when that story has been created. 

  2. List 2
    - Header: Inactive Stories
    - In this list set the background color of the rows to #FF0000 and list the Story title which is linked to Story url, checkbox to activate the story and button to submit the form.

  3. List 3 (contains Stories on which user made comments)
    - Header: Commented Stories
    - In this list set the background color of the rows to #00FF00 and list the Story title which is linked to Story url, text of the comment and the date when comment was created.

### Tests

Create the following RSpec tests (all target visual representation 2):

  1. Verify that there are three lists on the screen for visual representation two. One for active stories, one for inactive stories, and one for commented stories. 
  2. Verify that in the active list for user 1 there is correct number of stories. Verify that in the inactive stories list for user 1 there is correct number of stories. Verify that in the commented stories list for user 1 there is correct number of stories.
  3. Verify that when you check checkbox for some inactive story and submit the form the number of active stories for that particular user increases for 1.

## Once Complete

1. Commit and Push your code to your new repository
2. Send us a pull request, we will review your code and get back to you