extends Node

@export var _label : Label

@export var _prompts : Array[String]
@export var _promptsTriggered : Array[bool]

var _index : int = 0;

func _ready() -> void:
	
	SetIndex(0)

func SetIndex(index : int):
	_index = index
	if(_index >= _prompts.size()):
		queue_free()
	else:
		if(!_promptsTriggered[_index]):
			_label.text = _prompts[_index]
			_promptsTriggered[_index] = true
