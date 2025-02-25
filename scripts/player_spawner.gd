extends Node3D
class_name PlayerSpawner

static var ref : PlayerSpawner

func _init() -> void:
	ref = self


func setCheck() -> void:
	ref = self


func _on_set_check_body_entered(body: Node3D) -> void:
	if body is Player:
		setCheck()
