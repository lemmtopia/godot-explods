extends Area2D

const MOVE_SPEED = 350

var motion = Vector2(1, 0)

func _ready():
	add_to_group("player_shot")
	set_process(true)

func _process(delta):
	translate(motion * MOVE_SPEED * delta)
	
	if get_global_pos().x > 320:
		destroy_self(self)

func destroy_self(caller_node):
	queue_free()