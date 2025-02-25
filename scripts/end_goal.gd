extends Area3D
class_name EndGoal




func _on_body_entered(body: Node3D) -> void:
	if body is Player:
		LevelHandler.nextLevel()
	pass # Replace with function body.
