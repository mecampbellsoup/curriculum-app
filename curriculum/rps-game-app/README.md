---
  tags: sinatra
  languages: ruby
---

# Rock, Paper, Scissors

## Deliverable

Fork this repository. Your solution should be delivered in your master branch.

## Instructions

### Create the game model

Build the RPSGame model according to the rspec tests.

### Create the Sinatra app

Integrate your RPSGame class with the Sinatra application in app.rb.

The application will serve 1 route: GET requests to  the path /rps/:play.
The value of :play will be used as the player's throw (rock, paper, or
scissors). 

The Sinatra application should serve an HTML page that displays the move that
the player made, the move that the computer made, and whether the player won,
lost, or tied. 
