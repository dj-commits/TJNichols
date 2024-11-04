extends CharacterBody3D
var debug: bool = false

@export var move_speed: float
var mouse_pos: Vector2
var mouse_delta: Vector2
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(visible and debug):
		#print_debug("Local: " + str(get_viewport().get_mouse_position()))
		#print_debug("Global: " + str(global_position))
		print_debug("Transform.basis" + str(transform.basis))

	var new_mouse_pos = get_viewport().get_mouse_position()
	mouse_delta = (new_mouse_pos - mouse_pos).normalized()
	global_position += transform.basis * Vector3(0, 0, mouse_delta.y).normalized()
	mouse_pos = get_viewport().get_mouse_position()
