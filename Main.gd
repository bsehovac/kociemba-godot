extends Node2D

onready var solver = get_node('Solver')

func _ready():
	pass

func on_pruning_load():
	var cube = 'UUUUUUUUURRRRRRRRRFFFFFFFFFDDDDDDDDDLLLLLLLLLBBBBBBBBB'
	var pattern = 'BBURUDBFUFFFRRFUUFLULUFUDLRRDBBDBDBLUDDFLLRRBRLLLBRDDF'
	solver.solve(cube, pattern, self, 'on_solve_completed')
	
func on_solve_completed(_solution):
	pass
