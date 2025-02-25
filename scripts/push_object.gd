extends AnimatableBody3D


@onready var push_shape: CollisionShape3D = $pushShape


var tInterval : float 
var tInvterval2 : float 
@export var outval : float = 1.2
@export var inVal : float = .3

func _ready() -> void:
	tInterval = randf_range(1.7, 2.8)
	tInvterval2 = randf_range(1, 1.4)
	var newTween : Tween = create_tween()
	newTween.set_loops()
	newTween.set_ease(Tween.EASE_IN)
	newTween.set_trans(Tween.TRANS_SPRING)
	newTween.tween_interval(tInterval)
	newTween.tween_property(push_shape, "position", Vector3(-2.5,0,0),outval)
	newTween.tween_interval(tInvterval2)
	newTween.tween_property(push_shape, "position", Vector3(1.2,0,0), inVal)
