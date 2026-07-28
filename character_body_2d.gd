extends CharacterBody2D

const SPEED = 250
const ACCELERATION = 800
const FRICTION = 900
const JUMP_FORCE = -400
const GRAVITY = 900

func _physics_process(delta):
	# Gravity
	if not is_on_floor():
		velocity.y += GRAVITY * delta

	# Input
	var direction = Input.get_axis("ui_left", "ui_right")

	# Horizontal movement (UNCHANGED feel)
	if direction != 0:
		velocity.x = move_toward(velocity.x, direction * SPEED, ACCELERATION * delta)
	else:
		velocity.x = move_toward(velocity.x, 0, FRICTION * delta)

	# Jump
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_FORCE

	# Animation
	if not is_on_floor():
		$AnimatedSprite2D.play("jump")
	elif direction != 0:
		$AnimatedSprite2D.play("walk")
	else:
		$AnimatedSprite2D.play("idle")

	# Flip
	if direction > 0:
		$AnimatedSprite2D.flip_h = false
	elif direction < 0:
		$AnimatedSprite2D.flip_h = true

	# Move
	move_and_slide()

	# 🔥 PUSH SYSTEM (FIXED — no boost bug)
	for i in get_slide_collision_count():
		var col = get_slide_collision(i)

		if col.get_collider() is RigidBody2D:
			var body = col.get_collider()

			# ✅ Only push from side, not from top
			if abs(col.get_normal().x) > 0.9:
				body.apply_central_impulse(Vector2(velocity.x * 0.5, 0))
