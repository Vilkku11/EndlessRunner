extends CharacterBody3D
##
## Simple left/right character controller
##
signal collision

const SPEED = 5.0

func _physics_process(_delta: float) -> void:

	var input_dir := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

	var collision = get_last_slide_collision()
	if collision:
		print("Collided with: ", collision.get_collider())
		emit_signal("collision")
		#get_tree().quit()
