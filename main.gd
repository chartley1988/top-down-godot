extends Node

"""

This scene functions as the first and last script the game runs. It operates on the outside level.

"""
# Game Variables
# TODO: As many variables as possible should be moved out of this script eventually
@export var initial_map: PackedScene


# Called when the node enters the scene tree for the first time.
func _ready():
	print("Game started successfully!")



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass




