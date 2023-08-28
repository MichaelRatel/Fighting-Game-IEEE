# Fighting-Game-IEEE
 Fighting game made by UBGD for IEEE
This google Doc will have some of the outline, as well as a TODO for what needs to get done.
https://docs.google.com/document/d/14XbZC8IiO6HghS61nnqVaGtQsRlBA9rM27upKNKwGKk/edit?usp=sharing
state.gd
 - Using Godot's guide for state pattern implementation as per their documentation, state.gd holds the information of the state the player character is in, and calls methods to the current implementation of the state.

state_factory.gd
- Using Godot's guide for state pattern implementation, state_factory.gd holds a dictionary of states and their offical node names to refer to, as well as a get_state() method which returns a state's name for use in persistent_state.gd

persistent_state.gd
- Using Godot's guide for state pattern implementation, persistent_state.gd handles the changing of states, notably, changing the child node of the player object to a specific state based on commands or a response in game (think, an airborne state while holding jump). Temporarily, this node also handles inputs as well as calling different physics methods.

player1_control.gd
- currently unused, eventually will hold the main character control within the game

walk_state.gd
- State for holding down forward to make the character walk toward the opponent.

backwalk_state.gd
- State for holding down backward to make the character walk away from the opponent.

idle_state.gd
- State for not pressing any directional input to make the character wait. Should still be affected by physics.
