extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	printName("Carson")


func printName(name: String):
	print("Hello " + name)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _input(event):
	if not event is InputEventMouseMotion:
		print(event.as_text())
