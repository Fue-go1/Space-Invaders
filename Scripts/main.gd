extends Node2D
var wait_time_rand: float = randi_range(10.0, 20.0)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	%Restart.hide()
	%Victory_Label.hide()
	Engine.time_scale = 1
	#%Spawn_Mother.start()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	print("WAITING" + str(wait_time_rand))
	await get_tree().create_timer(wait_time_rand).timeout
	%Mother_ship.play("Moving")
	pass

func mothership_despawn():
	$MotherShip.queue_free()
	print("MotherSHIP despawned")

func _on_spawn_mother_timeout() -> void:
	
	pass # Replace with function body.
