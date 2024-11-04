extends CharacterBody3D
var debug: bool = true

@export var move_speed: float
var mouse_pos: Vector2
var mouse_delta: Vector2
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(visible):
		var new_mouse_pos = get_viewport().get_mouse_position()
		mouse_delta = (new_mouse_pos - mouse_pos).normalized()
		if debug: print_debug("Mouse delta" + str(mouse_delta))
		global_position += transform.basis * Vector3(mouse_delta.x, 0, mouse_delta.y).normalized() * move_speed
		mouse_pos = new_mouse_pos
