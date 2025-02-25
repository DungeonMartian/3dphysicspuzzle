extends RigidBody3D

class_name Player
static var ref : Player
func _init() -> void:
	ref = self

var speed : float = 120
var jumpSpeed : float = 800

var inputDirection : Vector2 

var resetting : bool = false



func _ready() -> void:
	pass

func _integrate_forces(state: PhysicsDirectBodyState3D) -> void:
	if PlayerSpawner.ref != null:
		if !resetting: 
			return
		else:
			state.sleeping = true
			state.transform.origin = PlayerSpawner.ref.global_position + Vector3(0,2,0)
			state.linear_velocity = Vector3.ZERO
			state.angular_velocity = Vector3.ZERO
			state.sleeping = false
			resetting = false

func _physics_process(delta: float) -> void:
	inputDirection = Input.get_vector("right", "left","up", "down")
	if inputDirection != Vector2(0,0):
		apply_torque(Vector3(inputDirection.y, 0,inputDirection.x) * speed * delta)
	
	if Input.is_action_just_pressed("space"):
		if get_contact_count() != 0:
			if is_zero_approx(linear_velocity.y):
				apply_central_force(Vector3(0,jumpSpeed,0))
