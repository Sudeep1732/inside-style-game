extends StaticBody2D

func open():
	visible = false
	$CollisionShape2D.set_deferred("disabled", true)

func close():
	visible = true
	$CollisionShape2D.set_deferred("disabled", false)
