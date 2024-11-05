extends CharacterBody3D
var debug: bool = true

@export var move_speed: float
@export var ray_length: float
var mouse_pos: Vector2
var mouse_delta: Vector2
var picking: bool
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
		
		if(Input.is_action_just_pressed("cxt_pick_up_obj")):
			picking = true
		
		move_and_collide(Vector3(velocity.x * delta, movement_y, movement_z))
		velocity.x = 0

func _physics_process(delta: float) -> void:
	if(picking):
		var screen_space = get_world_3d().direct_space_state
		var origin = $Sprite3D.global_position
		var end = origin * ray_length
		var query = PhysicsRayQueryParameters3D.create(origin,end)
		query.exclude = [self]
		var result = screen_space.intersect_ray(query)
		if(result):
			print_debug(result.collider)

func _input(event):
	if(event is InputEventMouseMotion):
		velocity.x = event.screen_relative.normalized().y
