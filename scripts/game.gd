extends Node

func _ready():
	get_node("player").connect("fire_performed", self, "on_player_fire_performed")

func on_player_fire_performed(player):
	get_node("samples").play("shoot")