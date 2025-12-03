extends Area2D

const MOVE_SPEED = 90

var motion = Vector2(1, 0)

func _ready():
	set_process(true)

func _process(delta):
	var move_x = 0
	var move_y = 0
	
	if Input.is_action_pressed("move_right"):
		move_x += 1
	if Input.is_action_pressed("move_left"):
		move_x -= 1
	if Input.is_action_pressed("move_down"):
		move_y += 1
	if Input.is_action_pressed("move_up"):
		move_y -= 1
	
	if move_y > 0:
		get_node("sprite").set_frame(1)
	elif move_y < 0:
		get_node("sprite").set_frame(2)
	else:
		get_node("sprite").set_frame(0)
	
	motion = Vector2(move_x, move_y).normalized()
	
	translate(motion * MOVE_SPEED * delta)