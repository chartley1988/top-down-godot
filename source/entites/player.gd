
extends Area2D


# Debug Variables
const DEBUG_LOG_KEYPRESS = false

const WALK_SPEED  = 5
const TILE_SIZE = 16

const INPUTS = {
	"ui_right": Vector2.RIGHT,
	"ui_left": Vector2.LEFT,
	"ui_up": Vector2.UP,
	"ui_down": Vector2.DOWN
}

var moving = false

@onready var ray = $RayCast2D

func _ready():
	position = position.snapped(Vector2.ONE * TILE_SIZE)
	print(position/16)


func _process(delta):
	pass


func _unhandled_key_input(event: InputEvent) -> void:
	if moving:
		return
	for dir in INPUTS.keys():
		if event.is_action_pressed(dir):
			print(dir)
			move(dir)


func move(dir):
	ray.target_position = INPUTS[dir] * TILE_SIZE
	ray.force_raycast_update()
	if !ray.is_colliding():
		var tween = create_tween()
		tween.tween_property(
			self, 
			"position",
			position + INPUTS[dir] * TILE_SIZE, 1.0/WALK_SPEED).set_trans(Tween.TRANS_SINE)
		moving = true
		await tween.finished
		moving = false
		print(position/TILE_SIZE)


func _input(event: InputEvent) -> void:
	pass

