class_name EntityCamera
extends Camera2D

func _ready():
	var tilemap: TileMap = (get_parent() as Entity).tilemap
	var map_rect: Rect2i = tilemap.get_used_rect()
	var tile_size: Vector2i = tilemap.tile_set.tile_size 
	# TODO: for some reason this is still ignoring the top row of tiles
	limit_left = map_rect.position.x * tile_size.x
	limit_top = map_rect.position.y * tile_size.y
	limit_right = map_rect.end.x * tile_size.x
	limit_bottom = map_rect.end.y * tile_size.y
