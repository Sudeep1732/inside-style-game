extends Area2D

func _ready():
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	if body.name == "CharacterBody2D":
		call_deferred("_restart_scene")


func _restart_scene():
	get_tree().reload_current_scene()
