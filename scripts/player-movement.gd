extends KinematicBody

var speed = 20
var velocity = Vector3.ZERO
var gravity = -9.8 * 3
const MAX_SPEED = 20
const ACCEL = 2
const DECCEL = 6
var direction
var acceleration
var target
var temp_velocity
var coins = 0
var left
var right
var up
var down

func _ready():
	print(up)


func get_input():
	direction = Vector3.ZERO
	left = Input.get_action_strength("analog_stick_left")
	right = Input.get_action_strength("analog_stick_right")
	up = Input.get_action_strength("analog_stick_up")
	down = Input.get_action_strength("analog_stick_down")
	if Input.is_action_pressed("ui_left") or left:
		direction.x -= left
	if Input.is_action_pressed("ui_right") or right:
		direction.x += right
	if Input.is_action_pressed("ui_down") or down:
		direction.z += down
	if Input.is_action_pressed("ui_up") or up:
		direction.z -= up
		print(up)
	direction = direction.normalized()

func _physics_process(delta):
	get_input()
	temp_velocity = velocity*Vector3(1,0,1)
	target = direction * speed
	if direction.dot(temp_velocity) > 0:
		acceleration = ACCEL
	else:
		acceleration = DECCEL
	temp_velocity = temp_velocity.linear_interpolate(target, acceleration * delta)
	velocity.x = temp_velocity.x
	velocity.z = temp_velocity.z
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector3(0,1,0))


func _on_Coin_body_entered(body):
	pass

func _on_Area_body_entered(body):
	pass

func _on_Area_area_entered(area):
	if(area.get_class()=="Coin"):
		coins += 1
		print(coins)
		area.queue_free()
