extends Node2D

@onready var button = $Button
@onready var door = $Door

func _ready():
	button.pressed.connect(_on_pressed)
	button.released.connect(_on_released)

func _on_pressed():
	door.open()

func _on_released():
	door.close()
