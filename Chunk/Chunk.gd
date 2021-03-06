extends StaticBody2D
class_name Chunk

var polygons : Array
var size : Vector2

func recalculate_collisions(bitmap):
	for child in get_children():
		if child is CollisionPolygon2D:
			child.queue_free()
	polygons = bitmap.opaque_to_polygons(Rect2(Vector2.ZERO, bitmap.get_size()))
	for polygon in polygons:
		var collision_shape = CollisionPolygon2D.new()
		collision_shape.polygon = polygon
		add_child(collision_shape)

func init(pos : Vector2, bitmap : BitMap) -> void:
	size = bitmap.get_size()
	recalculate_collisions(bitmap)
	global_position = pos
	

func get_rect():
	return Rect2(global_position, size)


#func _draw():
#	draw_rect(Rect2(Vector2.ZERO, size), Color.white, false)
