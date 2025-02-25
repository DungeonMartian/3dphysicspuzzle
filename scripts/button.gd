extends Area3D
class_name ProgressButton

@onready var red_part: MeshInstance3D = $redPart
@export var progressDoor : ProgessDoor
@onready var click: AudioStreamPlayer = $click

var isUsed : bool = false:
	set(value):
		isUsed = value
		if isUsed == true:
			red_part.position = Vector3(0,.06,0)

func _ready() -> void:
	if progressDoor == null:
		isUsed = true
	else:
		progressDoor.addButton(self, isUsed)

func _on_body_entered(body: Node3D) -> void:
	if body is Player:
		if !isUsed:
			isUsed = true
			if progressDoor:
				click.play()
				progressDoor.doorOpen(self, isUsed)
