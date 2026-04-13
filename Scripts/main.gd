extends Node2D
@export var mother_ship: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	%Restart.hide()
	%Victory_Label.hide()
	Engine.time_scale = 1
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:

	pass

func _on_spawn_mother_timeout() -> void:
	var mom = mother_ship.instantiate()
	mom.set_global_position(Vector2(-37, -37))
	add_child(mom)
	pass # Replace with function body.
