extends AnimatableBody3D
class_name ProgessDoor

var progButtons : Dictionary = {}
@onready var open: AudioStreamPlayer = $open

func _ready() -> void:
	
	pass

func addButton(button : ProgressButton, isUsed : bool) -> void:
	progButtons.get_or_add(button, isUsed)
	


func doorOpen(button : ProgressButton, isUsed : bool) -> void:
	progButtons[button] = isUsed
	var canClear : bool = true
	for i : bool in progButtons.values():
		if i == false:
			canClear = false
			break
	if canClear:
		visible = false
		collision_layer = 0
		collision_mask = 0
		open.play()
	
