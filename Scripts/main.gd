extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	%Restart.hide()
	%Victory_Label.hide()
	Engine.time_scale = 1
	%Spawn_Mother.start()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_spawn_mother_timeout() -> void:
	%Mother_ship.play("Moving")
	pass # Replace with function body.
