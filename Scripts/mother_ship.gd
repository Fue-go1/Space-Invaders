extends CharacterBody2D
@export var speed: int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var move = create_tween()
	move.tween_property(self, "global_position", global_position + Vector2.RIGHT * speed, 3.5)
	pass
