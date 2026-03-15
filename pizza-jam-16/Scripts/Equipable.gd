@abstract

class_name Equipable
extends Node3D

var _active : bool
var _equipped : bool

	
func OnEquip():
	_equipped = true;

func OnUnequip():
	_equipped = false;
