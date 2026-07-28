extends Node2D

@onready var button_a = $ButtonA
@onready var button_b = $ButtonB
@onready var door = $Door

var a_pressed = false
var b_pressed = false

var door_timer = 0.0
var door_open_time = 3.0   # give enough time

var door_is_open = false


func _ready():
	button_a.pressed.connect(_on_a_pressed)
	button_a.released.connect(_on_a_released)

	button_b.pressed.connect(_on_b_pressed)
	button_b.released.connect(_on_b_released)


func _process(delta):
	if door_timer > 0:
		door_timer -= delta
		if door_timer <= 0:
			door.close()
			door_is_open = false


func _on_a_pressed():
	a_pressed = true
	update_door()

func _on_a_released():
	a_pressed = false
	update_door()

func _on_b_pressed():
	b_pressed = true
	update_door()

func _on_b_released():
	b_pressed = false
	update_door()


func update_door():
	# BOTH pressed → open and cancel timer
	if a_pressed and b_pressed:
		if not door_is_open:
			door.open()
			door_is_open = true
		
		door_timer = 0  # stop timer completely

	# One released → start timer ONLY if door was open
	elif door_is_open:
		door_timer = door_open_time
