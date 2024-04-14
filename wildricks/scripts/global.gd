class_name Globals
extends Node

## Defines all global data structures that is needed throughout
## the game. This mainly includes story flags/checkpoints, cached
## settings, and other misc. stuff

# Story checkpoints so dialogue and sys can track game state
enum STORY_FLAGS {
	PROLOGUE,
	FRUIT_MISSION,
	SPIRIT_FESTIVAL,
	ACT_I_MORNING,
	NEW_PIER_STORY,
	NEW_PIER_FINISHED,
	ACT_II_MORNING,
	FINAL_PLAZA_MEETING,
	FINAL_MEETING,
	EPILOGUE
}

var cur_flag: STORY_FLAGS = STORY_FLAGS.PROLOGUE
