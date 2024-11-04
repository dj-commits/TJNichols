extends Node3D

signal stocking_started
var shelf: Node3D
var stocking: bool

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	shelf = get_parent()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(stocking):
		if(Input.is_action_just_pressed("cxt_stock")):
			stocking_started.emit()
			print_debug("somebody stock me")


func _on_area_3d_body_entered(body: Node3D) -> void:
	if(body.is_in_group("Player")):
		stocking = true



func _on_area_3d_body_exited(body: Node3D) -> void:
	if(body.is_in_group("Player")):
		stocking = false
