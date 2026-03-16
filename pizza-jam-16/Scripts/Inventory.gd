extends Node3D

@export var _items : Array[Equipable] = []

var _equippedIndex : int = 0

var _curEquipped : Equipable

func _ready() -> void:
	for item in _items:
		if(item != null):
			item.OnUnequip()

func _process(_delta: float) -> void:
	if(Input.is_action_just_pressed("next_item")):
		if(_items.size() == 0):
			pass
		_equippedIndex = (_equippedIndex + 1) % _items.size()
		EquipItem(_equippedIndex)
	if(Input.is_action_just_pressed("last_item")):
		if(_items.size() == 0):
			pass
		_equippedIndex = (_equippedIndex - 1)
		if(_equippedIndex < 0):
			_equippedIndex = _items.size() - 1
		EquipItem(_equippedIndex)
		

func AddItem(equipable : Equipable):
	_items.push_back(equipable)

func RemoveItemAtIndex(index : int):
	#Validate index
	if !ValidateIndex(index):
		pass
	#Remove
	_items.remove_at(index)
	
func RemoveItem(item : Equipable):
	#Find equipable
	var index : int = _items.find(item)
	#remove
	_items.remove_at(index)

func EquipItem(index : int):
	#Validate index
	if _curEquipped != null:
		_curEquipped.OnUnequip()
		_curEquipped = null
	if ValidateIndex(index):
		_curEquipped = _items[index]
		_curEquipped.OnEquip()
		print(_curEquipped.name + " equipped")
	
func UnEquipCurrentItem():
	if _curEquipped != null:
		_curEquipped.OnUnequip()
	
func ValidateIndex(index : int) -> bool:
	return index >= 0 && index < _items.size()
