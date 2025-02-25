extends Node

var levelArray : Array = [
	"res://scenes/world/levels/level1.tscn",
	"res://scenes/world/levels/level2.tscn",
	"res://scenes/world/levels/level3.tscn",
	"res://scenes/world/levels/level4.tscn",
	"res://scenes/world/levels/level5.tscn",
	"res://scenes/world/levels/level6.tscn",
	"res://scenes/world/levels/level7.tscn",
	"res://scenes/world/levels/level8.tscn",
	"res://scenes/world/levels/level9.tscn"
]

var curLevel : int = 0

func _ready() -> void:
	#get_tree().call_deferred("change_scene_to_file", levelArray[curLevel])
	pass

func nextLevel() -> void:
	
	if !curLevel >= levelArray.size()-1:
		curLevel+=1
	else:
		curLevel = 0
	get_tree().call_deferred("change_scene_to_file", levelArray[curLevel])
