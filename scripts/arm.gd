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
	var movement_y: float
	var movement_z: float
	if(visible):
		if(Input.is_action_pressed("cxt_stock_raise")):
			movement_y += move_speed * delta
		elif(Input.is_action_pressed("cxt_stock_lower")):
			movement_y -= move_speed * delta
		
		if(Input.is_action_pressed("cxt_stock_lateral_left")):
			movement_z += move_speed * delta
		elif(Input.is_action_pressed("cxt_stock_lateral_right")):
			movement_z -= move_speed * delta
		
		
		move_and_collide(Vector3(0, movement_y, movement_z))
		print_debug("global position" + str(global_position))
		print_debug("local position" + str(position))
