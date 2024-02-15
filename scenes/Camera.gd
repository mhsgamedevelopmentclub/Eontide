class_name OverworldCamera
extends Camera2D

@export var tilemap: TileMap

func _ready():
	var mapRect = tilemap.get_used_rect()
	var tileSize = tilemap.tile_set.tile_size 
	# TODO: for some reason this is still ignoring the top row of tiles
	limit_left = mapRect.position.x * tileSize.x
	limit_bottom = mapRect.position.y * tileSize.y
	limit_right = mapRect.end.x * tileSize.x
	limit_bottom = mapRect.end.y * tileSize.y
