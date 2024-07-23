
extends CharacterBody2D

# Debug Variables
const DEBUG_LOG_KEYPRESS = false

const WALK_SPEED  = 100


func _ready():
	pass # Replace with function body.


func _process(delta):
	pass


func _physics_process(delta):
	get_player_input()
	move_player()


func _input(event):
	if not event is InputEventMouseMotion:
		if DEBUG_LOG_KEYPRESS:
			print(event.as_text())
		return event.as_text()


func move_player():
	# self.velocity = Vector2(0,0)
	self.move_and_slide()
	self.velocity = Vector2(0,0)

	pass


func get_player_input():
	if Input.is_action_pressed("ui_left"):
		self.velocity.x -= WALK_SPEED

	if Input.is_action_pressed("ui_right"):
		self.velocity.x += WALK_SPEED

	if Input.is_action_pressed("ui_up"):
		self.velocity.y -= WALK_SPEED

	if Input.is_action_pressed("ui_down"):
		self.velocity.y += WALK_SPEED