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
