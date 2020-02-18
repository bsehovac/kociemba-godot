extends Node

var thread
var thread_start
var thread_callback

onready var kociemba = get_node("Kociemba")
onready var pruning = get_node("Pruning")

func _ready():
	set_process(false)

func solve(cube, pattern, ref, ref_callback):
	print('> Generating solution...')
	thread_start = OS.get_ticks_msec()
	thread_callback = funcref(ref, ref_callback)
	thread = Thread.new()
	thread.start(self, 'solving_thread', [cube, pattern], Thread.PRIORITY_HIGH)

func solving_thread(data):
	var solution = kociemba.solve(data[0], data[1], pruning)
	call_deferred('solving_complete', solution)

func solving_complete(solution):
	thread.wait_to_finish()
	print('> Solution found in ', float(OS.get_ticks_msec() - thread_start) / 1000.0, ' seconds')
	print('> Solution ', solution)
	thread_callback.call_func(solution)
