extends Node3D

var main_camera: Camera3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	main_camera = get_node("Player/PlayerCamera")
	get_node("Shelf/StockZone").stocking_started.connect(on_stocking_started)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func on_stocking_started():
	main_camera.current = false
	get_node("Player").visible = false
	main_camera = get_node("Shelf/StockZone/StockCamera")
	main_camera.current = true
	get_node("Shelf/StockZone/Arm").visible = true
