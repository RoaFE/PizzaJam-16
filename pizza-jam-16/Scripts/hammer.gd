extends "res://Scripts/tool.gd"

@export var _buildable : PackedScene

var _buildPoints : Array[Dictionary]

@export var _rayCast : RayCast3D

@export var _indicator : Node3D

signal ShelfBuilt()

func _physics_process(_delta: float) -> void:
	_rayCast.basis = _orientationSpace.basis
	if(_rayCast.is_colliding() && _rayCast.get_collider() is CollisionObject3D && _equipped):
		_indicator.visible = true
		var pos = (_rayCast.get_collider() as CollisionObject3D).global_position
		_indicator.global_position = pos
	else:
		_indicator.visible = false

func Action():
	if(!_equipped):
		return
	var result = super.ShootRay()
	
	if result:
		if(_buildPoints.size() > 0 && _buildPoints[0].collider_id == result.collider_id):
			return
		_buildPoints.push_back(result)
		if(_buildPoints.size() == 2):
			Build()

func OnUnequip():
	super.OnUnequip()
	_buildPoints.clear()

func Build():
	var pos0 : Vector3 = (_buildPoints[0].collider as Node3D).global_position;
	var pos1 : Vector3 = (_buildPoints[1].collider as Node3D).global_position;
	
	var midPoint : Vector3 = (pos0 + pos1) / 2
	var dist = (pos0 - pos1).length()
	
	
	var builtThing : Node3D = _buildable.instantiate() as Node3D
	get_tree().root.add_child(builtThing)
	
	var left = (pos0 - pos1).normalized() 
	print(left)
	var forward = (_buildPoints[0].collider.global_basis.z + _buildPoints[1].collider.global_basis.z).normalized() 
	if(forward == Vector3.ZERO):
		forward = (_buildPoints[0].collider.global_basis.x - _buildPoints[1].collider.global_basis.x).normalized() 
	var up = left.cross(forward).normalized();
	if(up.y < 0):
		up = -up
	print(up)
		
	
	builtThing.global_position = midPoint
	builtThing.global_basis = Basis(left,up,forward)
	builtThing.scale.x = max(.2,dist);
	_buildPoints[0].collider.queue_free()
	_buildPoints[1].collider.queue_free()
	_buildPoints.clear()
	ShelfBuilt.emit()
	
