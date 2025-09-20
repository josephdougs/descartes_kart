extends VehicleBody3D

var backwards = false

const STEER_SPEED = 3
const STEER_LIMIT = 0.4

@export var engine_force_value := 1000
@export var brake_power = 10

var _steer_target := 0.0

func _physics_process(delta: float) -> void:
	if (Input.is_action_pressed("up")):
		self.brake = 0
		print('hi')
		self.engine_force = engine_force_value
		print(self.engine_force)
	else:
		self.engine_force = 0
		if (Input.is_action_pressed("down")):
			self.brake = brake_power
		else:
			self.brake = 0
	
	_steer_target = Input.get_axis(&"right", &"left")
	_steer_target *= STEER_LIMIT
	steering = move_toward(steering, _steer_target, STEER_SPEED * delta)
