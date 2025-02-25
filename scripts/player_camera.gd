extends Camera3D



func _ready() -> void:
	pass
	

func _process(delta: float) -> void:
	if Player.ref != null:
		global_position.x = lerp(global_position.x, Player.ref.global_position.x, delta*10)
		global_position.z = lerp(global_position.z, Player.ref.global_position.z+8, delta*10)
