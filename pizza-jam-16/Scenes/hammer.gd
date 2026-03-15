extends "res://Scripts/tool.gd"

@export var _buildable : PackedScene

var _buildPoints : Array[Dictionary]

func Action():
	var result = super.ShootRay()
	
	if result:
		_buildPoints.push_back(result)
		if(_buildPoints.size() == 2):
			Build()

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
	var up = left.cross(forward);
	
	builtThing.global_position = midPoint
	builtThing.basis = Basis(left,up,forward)
	builtThing.scale.x = min(2,dist);
	_buildPoints.clear()
