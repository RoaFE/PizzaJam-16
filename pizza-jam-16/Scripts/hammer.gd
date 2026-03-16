extends "res://Scripts/tool.gd"

@export var _buildable : PackedScene

var _buildPoints : Array[Dictionary]

@export var _rayCast : RayCast3D

@export var _indicator : Node3D

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
		if(_buildPoints.find(result) != -1):
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
	
	print(_buildPoints[0].collider_id)
	print(_buildPoints[1].collider_id)
	
	var midPoint : Vector3 = (pos0 + pos1) / 2
	var dist = (pos0 - pos1).length()
	
	
	var builtThing : Node3D = _buildable.instantiate() as Node3D
	get_tree().root.add_child(builtThing)
	
	var left = (pos0 - pos1).normalized() 
	var forward = (_buildPoints[0].collider.basis.z + _buildPoints[1].collider.basis.z).normalized() 
	var up = left.cross(forward).normalized();
	if(up.y < 0):
		up = -up
		
	
	builtThing.global_position = midPoint
	builtThing.basis = Basis(left,up,forward)
	builtThing.scale.x = min(2,dist);
	_buildPoints.clear()
