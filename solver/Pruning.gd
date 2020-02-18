extends Node

var N_TWIST = 2187
var N_FLIP = 2048
var N_SLICE1 = 495
var N_SLICE2 = 24
var N_PARITY = 2
var N_URFtoDLF = 20160
var N_FRtoBR = 11880
var N_URtoUL = 1320
var N_UBtoDF = 1320
var N_URtoDF = 20160

var N_URFtoDLB = 40320
var N_URtoBR = 479001600

var N_MOVE = 18

var cache_dir = "res://solver/prunetables/"

var twistMove
var flipMove
var FRtoBR_Move
var URFtoDLF_Move
var URtoDF_Move
var URtoUL_Move
var UBtoDF_Move
var MergeURtoULandUBtoDF
var Slice_URFtoDLF_Parity_Prun
var Slice_URtoDF_Parity_Prun
var Slice_Twist_Prun
var Slice_Flip_Prun

var parityMove = [
	[1, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 1],
	[0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0],
]

var thread
var thread_start

func _ready():
	set_process(false)
	print('> Loading Pruning...')
	thread_start = OS.get_ticks_msec()
	thread = Thread.new()
	thread.start(self, 'pruning_thread', null, Thread.PRIORITY_LOW)

func pruning_thread(_data):
	var output = {}
	output.twistMove = load_cachetable('twistMove')
	output.flipMove = load_cachetable('flipMove')
	output.FRtoBR_Move = load_cachetable('FRtoBR_Move')
	output.URFtoDLF_Move = load_cachetable('URFtoDLF_Move')
	output.URtoDF_Move = load_cachetable('URtoDF_Move')
	output.URtoUL_Move = load_cachetable('URtoUL_Move')
	output.UBtoDF_Move = load_cachetable('UBtoDF_Move')
	output.MergeURtoULandUBtoDF = load_cachetable('MergeURtoULandUBtoDF')
	output.Slice_URFtoDLF_Parity_Prun = load_cachetable('Slice_URFtoDLF_Parity_Prun')
	output.Slice_URtoDF_Parity_Prun = load_cachetable('Slice_URtoDF_Parity_Prun')
	output.Slice_Twist_Prun = load_cachetable('Slice_Twist_Prun')
	output.Slice_Flip_Prun = load_cachetable('Slice_Flip_Prun')
	call_deferred('pruning_loaded', output)

func pruning_loaded(output):
	twistMove = output.twistMove
	flipMove = output.flipMove
	FRtoBR_Move = output.FRtoBR_Move
	URFtoDLF_Move = output.URFtoDLF_Move
	URtoDF_Move = output.URtoDF_Move
	URtoUL_Move = output.URtoUL_Move
	UBtoDF_Move = output.UBtoDF_Move
	MergeURtoULandUBtoDF = output.MergeURtoULandUBtoDF
	Slice_URFtoDLF_Parity_Prun = output.Slice_URFtoDLF_Parity_Prun
	Slice_URtoDF_Parity_Prun = output.Slice_URtoDF_Parity_Prun
	Slice_Twist_Prun = output.Slice_Twist_Prun
	Slice_Flip_Prun = output.Slice_Flip_Prun
	thread.wait_to_finish()
	print('> Pruning loaded in ', (OS.get_ticks_msec() - thread_start) / 1000.0, ' seconds')
	owner.on_pruning_load()

func load_cachetable(name):
	var file = File.new()
	file.open(cache_dir + name + '.json', file.READ)
	var text_json = file.get_as_text()
	var result_json = JSON.parse(text_json)
	if result_json.error == OK:
		return result_json.result
	else:
		print('Error loading file ', cache_dir, name, '.json')
		return null
