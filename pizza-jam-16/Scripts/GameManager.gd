extends Node

var active_scene : Node

func UnloadScene():
	if is_instance_valid(active_scene):
		active_scene.queue_free()
	active_scene = null

func LoadScene(scene_name : String):
	UnloadScene()
	var scenePath := "res://Scenes/%s.tscn" % scene_name
	var sceneResource := load(scenePath)
	if(sceneResource):
		active_scene = sceneResource.instantiate()
		get_tree().root.add_child(active_scene)
