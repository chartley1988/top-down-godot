
extends Area2D


# Debug Variables
const DEBUG_LOG_KEYPRESS = false

const WALK_SPEED  = 6
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
  for dir in INPUTS.keys():
    if moving:
      return
    if Input.is_action_just_pressed(dir):
      move(dir, Tween.TRANS_SINE)
      print("Just pressed")
    elif Input.is_action_just_released(dir):
      move(dir, Tween.TRANS_SINE)
      print("Just Released")
    elif Input.is_action_pressed(dir):
      move(dir, Tween.TRANS_LINEAR)
      print("Holding")


func move(dir, tween_type):
  ray.target_position = INPUTS[dir] * TILE_SIZE
  ray.force_raycast_update()
  if !ray.is_colliding():
    var tween = create_tween()
    tween.tween_property(
      self, 
      "position",
      position + INPUTS[dir] * TILE_SIZE, 1.0/WALK_SPEED).set_trans(Tween.TRANS_LINEAR)
    moving = true
    await tween.finished
    moving = false
    print(position/TILE_SIZE)


func _input(event: InputEvent) -> void:
  pass
