extends "res://Scripts/tool.gd"

@export var _drillHole : PackedScene

@export var _rayCast : RayCast3D

@export var _indicator : Node3D

signal OnDrill()

func Action():
	super.Action()
	if(!_equipped):
		return
	
	var result = super.ShootRay()
	if result:
		#if(result.position - global_position).length() < _range * _range:
		print("Hit at point: ", result.position)
		var hole = _drillHole.instantiate() as Node3D
		get_tree().root.add_child(hole)
		hole.transform = align_with_z(hole.transform, result.normal)
		hole.global_position = result.position;
		OnDrill.emit()

func _physics_process(_delta: float) -> void:
	_rayCast.basis = _orientationSpace.basis
	if(_rayCast.is_colliding() && _equipped):
		_indicator.visible = true
		var pos = _rayCast.get_collision_point()
		_indicator.global_position = pos
	else:
		_indicator.visible = false


## Transfer to Util Class
func align_with_z(xform, new_z):
	xform.basis.z = new_z
	xform.basis.y = Vector3(0,1,0)
	xform.basis.x = xform.basis.y.cross(new_z)
	xform.basis = xform.basis.orthonormalized()
	return xform
		
		
		
		
			
