extends CharacterBody2D
@export var speed: int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_hit_area_entered(area: Area2D) -> void:
	#$AnimationPlayer.play("destroyed")
	#await $AnimationPlayer.animation_finished
	%AnimationPlayer.play("destroyed")
	self.queue_free()
	print("IM HITTT")
	pass # Replace with function body.
