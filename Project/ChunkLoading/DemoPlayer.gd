extends PhysicsBody2D

@onready var label: Label = $Label

func _physics_process(delta):
	var velocity = Vector2()
	if (Input.is_action_pressed("ui_left")
		or Input.is_action_pressed("steer_left")):
		velocity.x = -1
	if (Input.is_action_pressed("ui_right")
		or Input.is_action_pressed("steer_right")):
		velocity.x = 1
	if (Input.is_action_pressed("ui_down")
		or Input.is_action_pressed("brake")):
		velocity.y = 1
	if (Input.is_action_pressed("ui_up")
	or Input.is_action_pressed("accelerate")):
		velocity.y = -1
		
	velocity = move_and_collide(
		velocity.normalized() * 500 * delta)
	label.text = var_to_str(position)
