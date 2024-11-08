extends Node3D

var main_camera: Camera3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	main_camera = get_node("Player/PlayerCamera")
	get_node("Shelves/Shelf/StockZone").stocking_started.connect(on_stocking_started)
	Input.mouse_mode = Input.MOUSE_MODE_CONFINED

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func on_stocking_started():
	main_camera.current = false
	get_node("Player").visible = false
	get_node("Shelves/Shelf/StockZone/GPUParticles3D").emitting = false
	get_node("Shelves/Shelf/StockZone/GPUParticles3D").visible = false
	main_camera = get_node("Shelves/Shelf/StockZone/StockCamera")
	main_camera.current = true
	get_node("Shelves/Shelf/StockZone/Arm").visible = true # best way to do this? Shouldn't the StockZone decide when the arm is visible?
