extends CharacterBody3D


@export var _speed = 5.0
@export var _acceleration = 5.0
@export var _jump_velocity = 4.5

@export var _inputSpace : Node3D; 

var _curSpeed := 0.0

signal PlayerDirectionUpdated(direction : Vector3)

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
	
	
	if direction:
		PlayerDirectionUpdated.emit(direction)
		_curSpeed = move_toward(_curSpeed, _speed, _acceleration * delta)
		
		velocity.x = direction.x * _curSpeed
		velocity.z = direction.z * _curSpeed
	else:
		_curSpeed = move_toward(_curSpeed, 0, _acceleration * delta)
		var velocityDirection = Vector3(velocity.x, 0 ,velocity.z).normalized()
		velocity.x = velocityDirection.x * _curSpeed
		velocity.z = velocityDirection.z * _curSpeed

	move_and_slide()
