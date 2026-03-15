extends "res://Scripts/Equipable.gd"

@export var _orientationSpace : Node3D
@export_flags_3d_physics var _collisionMask = (1 << 1 - 1) 

@export var _range : float = 1


func _ready() -> void:
	if(_orientationSpace == null):
		_orientationSpace = self;

func Setup():
	pass

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("action"):
		Action();

func Action():
	if(!_equipped):
		pass
	
func ShootRay() -> Dictionary:
	var space_state = get_world_3d().direct_space_state
	
	var query = PhysicsRayQueryParameters3D.create(global_position, global_position - (_orientationSpace.basis.z * _range), _collisionMask, [self])

	var result = space_state.intersect_ray(query)
	
	return result
