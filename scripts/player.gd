extends Area2D

const MOVE_SPEED = 90
const PRE_PLAYER_SHOT = preload("res://scenes/player_shot.tscn")

const WIDTH = 26
const HEIGHT = 21

const SHOTS_MAX = 5

var motion = Vector2(0, 0)
var last_fire = false

func _ready():
	get_node("flash").set_hidden(true)
	
	set_process(true)

func _process(delta):
	var fire = Input.is_action_pressed("fire")
	
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
	
	if fire and not last_fire and get_tree().get_nodes_in_group("player_shot").size() < SHOTS_MAX:
		var shot = PRE_PLAYER_SHOT.instance()
		get_parent().add_child(shot)
		shot.set_global_pos(get_global_pos() + Vector2(WIDTH / 2, 0))
		
		get_node("flash/anim").play("shoot")
	
	last_fire = fire