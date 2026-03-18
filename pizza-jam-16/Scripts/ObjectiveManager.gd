class_name ObjectiveManager

extends Node


@export var _objectives : Array[Objective]

@export var _uiParent : Control

var _objectiveText : Dictionary

signal  AllObjectivesComplete()

func _ready() -> void:
	for objective in _objectives:
		var text = RichTextLabel.new()
		text.fit_content = true
		text.bbcode_enabled = true
		text.add_theme_font_size_override("normal_font_size", 24)
		_uiParent.add_child(text);
		_objectiveText[objective] = text
		objective.OnObjectiveComplete.connect(UpdateObjectiveText)
	UpdateObjectiveText()
	

func UpdateObjectiveText():
	var objectivesComplete : bool = true
	for objective in _objectives:
		var text : RichTextLabel = _objectiveText[objective]
		var objectiveText : String = "- " + objective._objectiveMessage
		if(objective._objectiveComplete):
			text.text = "[s]" + objectiveText + "[/s]"
		else:
			text.text = objectiveText
		objectivesComplete = objectivesComplete && objective._objectiveComplete
	if(objectivesComplete):
		AllObjectivesComplete.emit()
			
		
		
