extends CharacterBody3D


@export var _speed = 5.0
@export var _jump_velocity = 4.5

@export var _inputSpace : Node3D; 
@export var _model : Node3D

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = _jump_velocity

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("move_left", "move_right", "move_forward", "move_backward")
	var direction := (_inputSpace.basis * Vector3(input_dir.x, 0, input_dir.y))
	direction.y = 0
	direction = direction.normalized()
	var up := Vector3(0,1,0)
	
	
	if direction:
		velocity.x = direction.x * _speed
		velocity.z = direction.z * _speed
		_model.basis = Basis(up.cross(-direction), up, -direction)
	else:
		velocity.x = move_toward(velocity.x, 0, _speed)
		velocity.z = move_toward(velocity.z, 0, _speed)

	move_and_slide()
