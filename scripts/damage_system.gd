extends Area2D

class_name HealthSystem
signal health_changed(new_health)
signal took_damage(damage_dealt:int)
signal destroyed
var is_visible:bool

@export var can_take_damage:bool=true:
	set(value):
		can_take_damage = value
		monitorable=can_take_damage

@export var can_deal_damage:bool=true:
	set(value):
		can_deal_damage = value
		monitoring=can_deal_damage
@export var max_health:int=1000
@export var health:int:
	set(value):
		health = min(max(0,value),max_health)
		health_changed.emit(health)

@export var damage:int

var is_destroyed:bool=false
@onready var screen_size:Vector2 = get_viewport_rect().size

func take_damage(damage_to_be_dealt:int)->void:
	health -= damage_to_be_dealt
	took_damage.emit(damage_to_be_dealt)
	if health == 0 and not is_destroyed:
		destroyed.emit()
		is_destroyed=true

func _ready()->void:
	area_entered.connect(on_area_entered)

func _process(delta)->void:
	is_visible=global_position.x>0 and global_position.x<screen_size.x and global_position.y>0 and global_position.y<screen_size.y
func on_area_entered(area)->void:	
	if area is HealthSystem and is_visible:
		area.take_damage(damage)


func disable():
	set_physics_process(false)
	set_process(false)
	for child in get_children():
		if child is CollisionShape2D or child is CollisionPolygon2D:
			child.set_deferred("disabled",true)
			break
