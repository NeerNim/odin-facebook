# Microverse project cycle split into 9 milestones
- Each milestones needs to have seperate feature branch 
- Everytime a milestone is complete create a pull request from **milestone-feature-branch**(this branch name should be descriptive) to the master branch
- Everytime the reviewer approves the milestone-branch it then should merge to the development branch
- When all the milebranch branch is complete and merged into the development branch then it will be merged to the master branch


## Between milestones
- Use feature branches for milestones, e.g. first-milestone, next-milestone.
- While one milestone is under the review, keep working on the next milestone.
- When one milestone is approved, merge that milestone’s branch to develop branch. - - Then merge changes from refreshed develop branch to next-milestone branch and resolve conflicts.
- Continue working on the next-milestone branch.
- Repeat this process for all milestones.
- Once the entire project is production-ready merge develop branch to master branch.


## Project todo 

## Milestone 1: Prepare data architecture documentation

    [] Make Entity Relationship Diagram (ERD)
    
    [] Friendship & Friendshiprequest
    
    [] Make status of the friendship to tell if it is a request or confirmed friendship.
    
    [] Make profile iamges as a link to gravatar
    
    [] Make docs directory in repo and add ERD image

## Milestone 2: Project setup
    [] Setup project as it is described in above requirements.

## Milestone 3: Users & posts
    [] Create models with associations and implement all requested features for users and posts. 
    
    [] Add authentication with Devise as described in requirements. Remember about unit and integrations tests!

## Milestone 4: Comments & likes
    [] Create models with associations and implement all requested features for comments and likes. 
    
    [] Write unit and integrations tests!

## Milestone 5: Friendships v1
## Milestone 6: Friendships v2
## Milestone 7: Omniauth
## Milestone 8: Deploy your app to Heroku






