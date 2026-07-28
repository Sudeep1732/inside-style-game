extends Area2D

func _ready():
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	if body.name == "CharacterBody2D":
		call_deferred("_go_to_next_level")


func _go_to_next_level():
	get_tree().change_scene_to_file("res://Level2.tscn")
