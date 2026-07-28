extends Area2D

signal pressed
signal released

var bodies_inside = []

func _ready():
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)

func _on_body_entered(body):
	if body.name == "CharacterBody2D" or body.name == "box":
		bodies_inside.append(body)
		if bodies_inside.size() == 1:
			print("Button pressed")
			emit_signal("pressed")

func _on_body_exited(body):
	if body in bodies_inside:
		bodies_inside.erase(body)
		if bodies_inside.size() == 0:
			print("Button released")
			emit_signal("released")
