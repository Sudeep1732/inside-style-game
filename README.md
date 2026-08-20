# Inside-Style Game

A 2D side-scrolling puzzle platformer built with Godot, inspired by the atmospheric design and gameplay philosophy of games such as *Limbo* and *Inside*.

## Screenshots

### Gameplay
![Gameplay](screenshots/gameplay.jpg)

### Puzzle / Interaction
![Puzzle](screenshots/puzzle.jpg)

### Development
![Development](screenshots/development.jpg)

## Current Features

### Player
- Smooth movement with acceleration and friction
- Jumping
- Idle, walking, and jumping animations
- Can push `RigidBody2D` boxes

### Physics Box
- Used for environmental puzzles
- Can be pushed by the player
- Can be placed on buttons
- Can also be used as a platform

### Button System
- Detects both the player and boxes
- Supports multiple bodies without flickering
- Emits pressed/released states
- Uses `body_entered` and `body_exited`

### Door System
- Opens and closes through puzzle logic
- Collision is safely enabled/disabled using deferred physics operations
- Supports timed opening

### Hazards
- Spike system kills the player
- Scene reload is handled safely using deferred calls

### Level Transitions
- Exit areas transition between levels
- Current flow:
  - Level 1 → Level 2

## Levels

### Level 1

Introduces the core mechanics:

- Box pushing
- Spikes
- Button → Door interaction
- Basic puzzle progression

The goal is to introduce mechanics clearly before combining them.

### Level 2

Expands the puzzle system with:

- Button A + Button B → Door
- Box placed on one button
- Player activates the second button
- Timed door behaviour

The timed-door system was implemented to keep the door stable briefly after a button is released.

## Visual System

The project currently uses a four-layer parallax background:

- Near layer
- Layer 2
- Layer 3
- Far layer

Different motion scales are used to create depth.

Current visual work is focused on improving the separation between layers through:

- Brightness differences
- Fog
- Contrast
- Better atmospheric depth

## Design Philosophy

The project aims for a minimal and atmospheric experience:

- Minimal UI
- Dark atmosphere
- Environmental storytelling
- Puzzles based on interaction and danger
- Gradual introduction of mechanics

The goal is to evolve existing mechanics into stronger puzzles rather than continuously adding unrelated systems.

## Current Limitations

- Ground is currently flat
- No slopes yet
- Player can push objects but cannot pull them
- Parallax layers still need stronger visual separation
- More level and puzzle variety is still being developed

## What I'm Working On Next

- Stronger level design
- More interesting puzzle progression
- Better visual depth
- Improved fog and lighting
- New mechanics only when they are needed for gameplay

## Built With

- Godot
- GDScript

## Controls

- **Left / Right Arrow** — Move
- **Space** — Jump

## Project Status

🚧 **In active development**

This is an ongoing personal game-development project focused on learning and implementing gameplay systems, puzzle design, physics interactions, and atmospheric 2D environments.
