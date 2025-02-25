extends Node3D
class_name World
const P = preload("res://scenes/player/player.tscn")
const PLAYER_CAMERA = preload("res://scenes/player/playerCamera.tscn")
var SKY_NOISE = preload("res://assets/noise/skyNoise.tres")
func _ready() -> void:
	if Player.ref == null:
		var i : Player = P.instantiate()
		add_child(i)
		var j : Camera3D = PLAYER_CAMERA.instantiate()
		j.rotation_degrees = Vector3(-60, 0, 0)
		add_child(j)
		j.global_position = Vector3(0,8,8)

func _process(delta: float) -> void:
	SKY_NOISE.offset.x += 5*delta

func _on_world_boundary_body_entered(body: Node3D) -> void:
	if body is Player:
		Player.ref.resetting = true
