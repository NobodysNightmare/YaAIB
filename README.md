# Yet Another AI Battle

This game is all about writing your own Ruby AI to conquer the universe.
I totally ripped this idea from a former co-student who implemented a similar game in Java (and he probably took the idea from someone else himself :)).

# Game mechanics

## Planets

Each planet under control of a player will resupply over time.
Neutral planets have some defensive force, but do not resupply on their own until they are conquered.
Every player has a single starting planet.

## Fleets

Using the supplies of one of your planets you can send out fleets to other planets. If a fleet arrives
at an allied planet it will stock up the supplies of this planet, if it arrives at a neutral or hostile
planet, it will reduce the supplies of that planet.

Once a fleet turns the supplies of a planet down to zero, the planet is conquered by that player.

## Goal

There can only be one. You have won, once no other player has planets anymore.

# API for players

## Basics

Your AI will have to inherit from `YaAIB::Player` and your ruby file will have to reside under
`lib/yaaib/players`.

You can override the following methods:

* `think(interface)` This will be called when it is time to make your turn. You can use the interface
  to interact with the world
* `name` Return a cool name for your AI. If you don't, its class name will be taken.
* `author` Your name or the handle you go by, i.e. this is not the name of your AI, but yours.
* `color` Return an array containing three RGB values between 0 and 255. Those will be used in the
  visual runner to distinguish your AI from the others. If you don't override it, you get a random color
  each round.

The best documentation at the moment are other players, e.g. my silly `DumbFirePlayer`.

## API documentation

TODO

# Things to do before this is fun

* Improve universe generation
    * different planet sizes (resupply, initial forces)
    * better scaling of planet count
* Add more helpful APIs
    * query incoming fleets per planet
* Better cheat protection
    * **yes you could cheat** (e.g. add 1000 to your planets supplies)
    * at least do some basic separation to avoid unintended cheats (i.e. AI-bugs)
* A better visual runner
    * more appealing graphics
    * control simulation speed
    * screen for end of round
    * start new round
* A competitive console runner
    * simulate many (thousands) of rounds and see who is best on average
