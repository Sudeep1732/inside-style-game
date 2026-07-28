extends CharacterBody2D

const SPEED = 80
const GRAVITY = 900

var direction = -1

@onready var ray = $RayCast2D
@onready var anim = $AnimatedSprite2D


func _ready():
	anim.play("walk")


func _physics_process(delta):

	# gravity
	if not is_on_floor():
		velocity.y += GRAVITY * delta
	else:
		velocity.y = 0

	# movement
	velocity.x = direction * SPEED

	# move ray
	ray.position.x = 20 * direction

	# edge detection
	if is_on_floor() and not ray.is_colliding():
		direction *= -1

	# apply movement
	var old_velocity_x = velocity.x
	move_and_slide()

	# stuck detection (KEY FIX)
	if abs(velocity.x) < 1 and abs(old_velocity_x) > 0:
		direction *= -1

	# flip sprite
	anim.flip_h = direction > 0
