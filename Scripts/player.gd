extends CharacterBody2D
@export var speed: int
@export var projectiles: PackedScene
var max_per_shot: int
var game_over: PackedScene = preload("res://Scenes/restart.tscn")
var mission_triggered: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var direction = Input.get_axis("left", "right")
	move_and_slide()
	position.x += direction * speed * delta
	
	if Input.is_action_pressed("left"):
		%AnimationPlayer.play("left")
	elif Input.is_action_pressed("right"):
		%AnimationPlayer.play("right")
	else:
		%AnimationPlayer.play("static")
		pass
	
	if Input.is_action_just_pressed("shoot") and max_per_shot == 0:
		var shot_audio: int = randi_range(1, 2)
		if shot_audio == 1:
			%Shoot.stream = preload("res://Assets/SFX/Laser_shot.mp3")
			%Shoot.play()
		else:
			%Shoot.stream = preload("res://Assets/SFX/Laser_shot2.mp3")
			%Shoot.play()
			pass
		var rocket = projectiles.instantiate()
		get_parent().add_child(rocket)
		rocket.global_position = %Marker2D.global_position
		max_per_shot += 1
		%Cooldown.start()
		
	if Autoload.enemy_death_count == 8 and not mission_triggered:
		mission_triggered = true
		$Hurtbox/CollisionShape2D.disabled = true
		$CollisionShape2D.disabled = true
		%Victory_Label.show()
		%Lift_off.start()
		var mission_complete = create_tween()
		mission_complete.tween_property(%Player, "global_position", Vector2(576,587), 1)
		print("LIFTOFFFFF")
		%Return_to_normal_speed.start()
		%Slow_down.play("slowdown")
		await get_tree().create_timer(1.0).timeout
		%Slow_down.play("normal")
	pass

func _on_cooldown_timeout() -> void:
	max_per_shot = 0
	pass # Replace with function body.

func _on_hurtbox_area_entered(area: Area2D) -> void:
	%Death_sound.play()
	var you_died = preload("res://Scenes/you_died.tscn").instantiate()
	you_died.global_position = global_position
	get_tree().current_scene.add_child(you_died)
	you_died.play()
	queue_free()
	%Restart.show()
	pass # Replace with function body.

func _slowdown():
	Engine.time_scale = .5
	var finished_sound = preload("res://Scenes/last_hit.tscn").instantiate()
	finished_sound.global_position = global_position
	get_tree().current_scene.add_child(finished_sound)
	finished_sound.play()
	pass
#Find out how to use await to trigger an animation using the Timer Nodes

func _on_return_to_normal_speed_timeout() -> void:
	Engine.time_scale = 1
	pass # Replace with function body.
