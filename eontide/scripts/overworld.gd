class_name Overworld
extends Node2D

@onready var tilemap: TileMap = $TileMap as TileMap

var world_bounds: Array[Vector2i]

func _ready() -> void:
	var map_rect: Rect2i = tilemap.get_used_rect()
	var tile_size: Vector2i = tilemap.tile_set.tile_size 
	world_bounds[0] = Vector2i(
		map_rect.position.x * tile_size.x, map_rect.position.y * tile_size.y)
	world_bounds[1] = Vector2i(
		map_rect.end.x * tile_size.x, map_rect.end.y * tile_size.y)
