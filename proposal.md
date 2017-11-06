Name: Luke Wood           ID:   46802422

## Proposed Project

I would like to create a fault tolerant web based multiplayer game.  The 'business logic' will be
taken care of by the elixir backend and the frontend will handle user input/rendering.  The game will render
onto a canvas element.  User -> Server communication will be done using web sockets (seems neccesary as the game will be real time).

The basic structure of the game is a 2d shooter in the general "Style" of <a href="agar.io">agar.io</a> (read: simple).
The primary goal of this project is to get down the backend server structure, client communication, and effective state management.

I think the potential scope of this is quite large so while I plan on completing the entire game (including the web app),
I will work in an order that lends itself to having something to showcase at the end of the project regardless of how far I get.  

To cover the case that getting a functional backend is a larger time commitment than expected, I will implement the
'business logic' first.  If it seems realistic to also get a web client done and all communication I will proceed in that direction - otherwise I will work on an elixir simulator to test the game engine.  The entire client api will be exposed via a GenServer api so I will be able to write a fully functional demo of the engine and render the results to a terminal or some sort of alternative display.

That being said the whole reason I picked this project over a data visualization is I thought it would be fun to make a highly fault tolerant web game - so I am really leaning that direction even if it takes longer than rendering a simulation locally to a terminal.

## Outline Structure

I've begun to work a bit on the project and I currently have this module structure:

2DShooterPhoenixServer
-> this will have one or multiple GameServers running on it (last priority is implementing support for concurrent games.)

GameServer
-> has/supervises multiple child processes
-> I believe the game server will initially be :permanent in the case of a single game instance, :temporal if I add support for concurrent games.
-> handles user input and delegates that input to respective servers
-> handles system time changes and passes that information down to children to maintain synchronization across children
-> uses Task.async to simultaneously update it's children on each call to "tick"
-> BulletServer
-> PlayerServer
-> still deciding where collision detection should take place.

and the other servers:

BulletServer
-> maintains the status of all currently existing bullets
-> cleans bullets out after their "expiration" time.
-> updates bullets appropriately based on the time passed from the parent

PlayerServer
-> maintains players state, we should be able to dynamically add players like in agar.io
-> updates players based on inputs handed down from GameServer

KeyVal
-> key val pair server, currently using this in my BulletServer but I will refactor this out quickly.  Unneccesary in this case but it may be valuable for the lobbyserver if I implement multiple game support.

current problems:
Collision detection seems like it's going to be a really expensive operation.  Not sure how this is going to work out but this is the next item on my 'chopping block' so I will know in the near future how hard it will be to keep this reasonable.
An obvious workaround to this is to cap the number of players per game and spin up extra games when that number is exceeded - also reload times for players are a possible solution to this.  The big O of this is conceivably O(bullets * players + bullets * walls) so if we cap one of those it seems easy to run this every 50ms or so.  Maybe this needs it's own server to perform this detection asyncrously and then we can pass the Server callbacks to fire when a specific type of detection is found - who knows, I anticipate this being the most technically challenging problem.

TLDR:
Simple multiplayer web game with all the backend logic run on an elixir server with child servers handling specific components.
No game engine so everything will be written in pure elixir which should lead to some interesting challenges.

