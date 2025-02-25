extends Area3D




func _on_body_entered(body: Node3D) -> void:
	if body is Player:
		body.apply_central_force(Vector3(0,2500,0))
	pass # Replace with function body.
