extends Node

class_name Kociemba

# ------------------------------------------------------------
# ------------------------ VARIABLES ------------------------
# ------------------------------------------------------------

# Colors

const U = 0
const R = 1
const F = 2
const D = 3
const L = 4
const B = 5

const color_values = [
	U,
	R,
	F,
	D,
	L,
	B,
]

const color_keys = [
	'U',
	'R',
	'F',
	'D',
	'L',
	'B',
]

const colors = {
	'U': U,
	'R': R,
	'F': F,
	'D': D,
	'L': L,
	'B': B,
}

# Corner

const URF = 0
const UFL = 1
const ULB = 2
const UBR = 3
const DFR = 4
const DLF = 5
const DBL = 6
const DRB = 7

const corner_values = [
	URF,
	UFL,
	ULB,
	UBR,
	DFR,
	DLF,
	DBL,
	DRB,
]

const corner_keys = [
	'URF',
	'UFL',
	'ULB',
	'UBR',
	'DFR',
	'DLF',
	'DBL',
	'DRB',
]

# Edge

const UR = 0
const UF = 1
const UL = 2
const UB = 3
const DR = 4
const DF = 5
const DL = 6
const DB = 7
const FR = 8
const FL = 9
const BL = 10
const BR = 11

const edge_values = [
	UR,
	UF,
	UL,
	UB,
	DR,
	DF,
	DL,
	DB,
	FR,
	FL,
	BL,
	BR,
]

const edge_keys = [
	'UR',
	'UF',
	'UL',
	'UB',
	'DR',
	'DF',
	'DL',
	'DB',
	'FR',
	'FL',
	'BL',
	'BR',
]

# Facelet

const U1 = 0
const U2 = 1
const U3 = 2
const U4 = 3
const U5 = 4
const U6 = 5
const U7 = 6
const U8 = 7
const U9 = 8
const R1 = 9
const R2 = 10
const R3 = 11
const R4 = 12
const R5 = 13
const R6 = 14
const R7 = 15
const R8 = 16
const R9 = 17
const F1 = 18
const F2 = 19
const F3 = 20
const F4 = 21
const F5 = 22
const F6 = 23
const F7 = 24
const F8 = 25
const F9 = 26
const D1 = 27
const D2 = 28
const D3 = 29
const D4 = 30
const D5 = 31
const D6 = 32
const D7 = 33
const D8 = 34
const D9 = 35
const L1 = 36
const L2 = 37
const L3 = 38
const L4 = 39
const L5 = 40
const L6 = 41
const L7 = 42
const L8 = 43
const L9 = 44
const B1 = 45
const B2 = 46
const B3 = 47
const B4 = 48
const B5 = 49
const B6 = 50
const B7 = 51
const B8 = 52
const B9 = 53

const facelet_values = [
	U1,
	U2,
	U3,
	U4,
	U5,
	U6,
	U7,
	U8,
	U9,
	R1,
	R2,
	R3,
	R4,
	R5,
	R6,
	R7,
	R8,
	R9,
	F1,
	F2,
	F3,
	F4,
	F5,
	F6,
	F7,
	F8,
	F9,
	D1,
	D2,
	D3,
	D4,
	D5,
	D6,
	D7,
	D8,
	D9,
	L1,
	L2,
	L3,
	L4,
	L5,
	L6,
	L7,
	L8,
	L9,
	B1,
	B2,
	B3,
	B4,
	B5,
	B6,
	B7,
	B8,
	B9,
]

const facelets = {
	'U1': U1,
	'U2': U2,
	'U3': U3,
	'U4': U4,
	'U5': U5,
	'U6': U6,
	'U7': U7,
	'U8': U8,
	'U9': U9,
	'R1': R1,
	'R2': R2,
	'R3': R3,
	'R4': R4,
	'R5': R5,
	'R6': R6,
	'R7': R7,
	'R8': R8,
	'R9': R9,
	'F1': F1,
	'F2': F2,
	'F3': F3,
	'F4': F4,
	'F5': F5,
	'F6': F6,
	'F7': F7,
	'F8': F8,
	'F9': F9,
	'D1': D1,
	'D2': D2,
	'D3': D3,
	'D4': D4,
	'D5': D5,
	'D6': D6,
	'D7': D7,
	'D8': D8,
	'D9': D9,
	'L1': L1,
	'L2': L2,
	'L3': L3,
	'L4': L4,
	'L5': L5,
	'L6': L6,
	'L7': L7,
	'L8': L8,
	'L9': L9,
	'B1': B1,
	'B2': B2,
	'B3': B3,
	'B4': B4,
	'B5': B5,
	'B6': B6,
	'B7': B7,
	'B8': B8,
	'B9': B9,
}

# ------------------------------------------------------------
# ------------------------ CoordCube -------------------------
# ------------------------------------------------------------

class CoordCube:
	var twist
	var flip
	var parity
	var FRtoBR
	var URFtoDLF
	var URtoUL
	var UBtoDF
	var URtoDF

	func _init(c):
		twist = c.getTwist()
		flip = c.getFlip()
		parity = c.cornerParity()
		FRtoBR = c.getFRtoBR()
		URFtoDLF = c.getURFtoDLF()
		URtoUL = c.getURtoUL()
		UBtoDF = c.getUBtoDF()
		URtoDF = c.getURtoDF()

	func move(m, Pruning):
		#var Pruning = get_node("/root/Pruning")
		twist = Pruning.twistMove[twist][m]
		flip = Pruning.flipMove[flip][m]
		parity = Pruning.parityMove[parity][m]
		FRtoBR = Pruning.FRtoBR_Move[FRtoBR][m]
		URFtoDLF = Pruning.URFtoDLF_Move[URFtoDLF][m]
		URtoUL = Pruning.URtoUL_Move[URtoUL][m]
		UBtoDF = Pruning.UBtoDF_Move[UBtoDF][m]
		if (URtoUL < 336 and UBtoDF < 336):
			URtoDF = Pruning.MergeURtoULandUBtoDF[URtoUL][UBtoDF]

# ------------------------------------------------------------
# ------------------------ CubieCube -------------------------
# ------------------------------------------------------------

class CubieCube:
	var cp
	var co
	var ep
	var eo

	func _init(_cp = null, _co = null, _ep = null, _eo = null):
		cp = _cp.duplicate() if _cp else [URF, UFL, ULB, UBR, DFR, DLF, DBL, DRB]
		co = _co.duplicate() if _co else [0, 0, 0, 0, 0, 0, 0, 0]
		ep = _ep.duplicate() if _ep else [UR, UF, UL, UB, DR, DF, DL, DB, FR, FL, BL, BR]
		eo = _eo.duplicate() if _eo else [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]

	func Cnk(n, k):
		if n < k:
			return 0
		if k > floor(n / 2):
			k = n - k
		var s = 1
		var i = n
		var j = 1
		while i != n - k:
			s *= i
			s = floor(s / j)
			i -= 1
			j += 1
		return s

	func rotateLeft(arr, l, r):
		var temp = arr[l]
		for i in range(l, r):
			arr[i] = arr[i + 1]
		arr[r] = temp

	func rotateRight(arr, l, r):
		var temp = arr[r]
		for i in range(r, l, -1):
			arr[i] = arr[i - 1]
		arr[l] = temp

	func toFaceCube():
		var fcRet = FaceCube.new()
		var ori
		for i in corner_values:
			var j = cp[i]
			ori = co[i]
			for n in range(3):
				var _butya = fcRet.cornerFacelet[i][(n + ori) % 3]
				fcRet.f[_butya] = fcRet.cornerColor[j][n]
		for i in edge_values:
			ori = eo[i]
			for n in range(2):
				var _butya = fcRet.edgeFacelet[i][(n + ori) % 2]
				fcRet.f[_butya] = fcRet.edgeColor[ep[i]][n]
		return fcRet

	func cornerMultiply(b):
		var cPerm = []
		var cOri = []
		for i in corner_values:
			cPerm.append(cp[b.cp[i]])
			
			var oriA = co[b.cp[i]]
			var oriB = b.co[i]
			var ori = 0
			
			if oriA < 3 and oriB < 3:
				ori = int(oriA + oriB) & 0xff
				if ori >= 3:
					ori -= 3
			elif oriA < 3 and oriB >= 3:
				ori = int(oriA + oriB) & 0xff
				if ori >= 6:
					ori -= 3
			elif oriA >= 3 and oriB < 3:
				ori = int(oriA - oriB) & 0xff
				if ori < 3:
					ori += 3
			elif oriA >= 3 and oriB >= 3:
				ori = int(oriA - oriB) & 0xff
				if ori < 0:
					ori += 3
			
			cOri.append(ori)
		
		for i in corner_values:
			cp[i] = cPerm[i]
			co[i] = cOri[i]

	func edgeMultiply(b):
		var ePerm = []
		var eOri = []
		for i in edge_values:
			var temp = b.ep[i]
			ePerm.append(ep[temp])
			eOri.append(int((b.eo[i] + eo[temp]) % 2) & 0xff)

		for i in edge_values:
			ep[i] = ePerm[i]
			eo[i] = eOri[i]

	func multiply(b):
		cornerMultiply(b)
		edgeMultiply(b)

	func invCubieCube(c):
		for i in edge_values:
			c.ep[ep[i]] = i
		for i in edge_values:
			c.eo[i] = eo[c.ep[i]]
		for i in corner_values:
			c.cp[cp[i]] = i
		for i in corner_values:
			var ori = co[c.cp[i]]
			if ori >= 3:
				c.co[i] = ori
			else:
				c.co[i] = -ori
				if c.co[i] < 0:
					c.co[i] += 3

	func getTwist():
		var ret = 0
		for i in range(URF, DRB):
			ret = int(3 * ret + co[i]) & 0xffff
		return ret

	func setTwist(twist):
		var twistParity = 0
		for i in range(DRB - 1, URF - 1, -1):
			co[i] = int(twist % 3) & 0xff
			twistParity += co[i]
			twist = floor(twist / 3)
		co[DRB] = int((3 - twistParity % 3) % 3) & 0xff

	func getFlip():
		var ret = 0
		for i in range(UR, BR):
			ret = int(2 * ret + eo[i]) & 0xffff
		return ret

	func setFlip(flip):
		var flipParity = 0
		for i in range(BR - 1, UR - 1, -1):
			eo[i] = int(flip % 2) & 0xff
			flipParity += eo[i]
			flip = floor(flip / 2)
		eo[BR] = int((2 - flipParity % 2) % 2) & 0xff

	func cornerParity():
		var s = 0
		for i in range(DRB, URF, -1):
			for j in range(i - 1, URF - 1, -1):
				if cp[j] > cp[i]:
					s += 1
		return int(s % 2) & 0xffff

	func edgeParity():
		var s = 0
		for i in range(BR, UR, -1):
			for j in range(i - 1, UR - 1, -1):
				if ep[j] > ep[i]:
					s += 1
		return int(s % 2) & 0xffff

	func getFRtoBR():
		var a = 0
		var x = 0
		var edge4 = Helpers.init_empty_array(4, null)
		for j in range(BR, UR - 1, -1):
			if (FR <= ep[j] and ep[j] <= BR):
				a += Cnk(11 - j, x + 1)
				edge4[3 - x] = ep[j]
				x += 1
		
		var b = 0
		for j in range(3, 0, -1):
			var k = 0
			while (edge4[j] != j + 8):
				rotateLeft(edge4, 0, j)
				k += 1
			b = (j + 1) * b + k
		return int(24 * a + b) & 0xffff

	func setFRtoBR(idx):
		var sliceEdge = [FR, FL, BL, BR]
		var otherEdge = [UR, UF, UL, UB, DR, DF, DL, DB]
		var b = idx % 24
		var a = floor(idx / 24)
		for i in edge_values:
			ep[i] = DB

		for j in range(1, 4):
			var k = b % (j + 1)
			b = floor(b / (j + 1))

			while k > 0:
				k -= 1
				rotateRight(sliceEdge, 0, j)

		var x = 3
		for j in range(UR, BR + 1):
			if a - Cnk(11 - j, x + 1) >= 0:
				ep[j] = sliceEdge[3 - x]
				a -= Cnk(11 - j, x + 1)
				x -= 1
		x = 0
		for j in range(UR, BR + 1):
			if ep[j] == DB:
				ep[j] = otherEdge[x]
				x += 1

	func getURFtoDLF():
		var a = 0
		var x = 0
		var corner6 = []
		for j in range(URF, DRB + 1):
			if cp[j] <= DLF:
				a += Cnk(j, x + 1)
				corner6.append(cp[j])
				x += 1

		var b = 0
		for j in range(5, 0, -1):
			var k = 0
			while corner6[j] != j:
				rotateLeft(corner6, 0, j)
				k += 1
			b = (j + 1) * b + k
		return int(720 * a + b) & 0xffff

	func setURFtoDLF(idx):
		var corner6 = [URF, UFL, ULB, UBR, DFR, DLF]
		var otherCorner = [DBL, DRB]
		var b = idx % 720
		var a = floor(idx / 720)
		for i in corner_values:
			cp[i] = DRB

		for j in range(1, 6):
			var k = b % (j + 1)
			b = floor(b / (j + 1))
			while k > 0:
				k -= 1
				rotateRight(corner6, 0, j)
		var x = 5

		for j in range(DRB, -1, -1):
			if a - Cnk(j, x + 1) >= 0:
				cp[j] = corner6[x]
				a -= Cnk(j, x + 1)
				x -= 1
		x = 0
		for j in range(URF, DRB + 1):
			if cp[j] == DRB:
				cp[j] = otherCorner[x]
				x += 1

	func getURtoDF():
		var a = 0
		var x = 0
		var edge6 = []
		for j in range(UR, BR + 1):
			if ep[j] <= DF:
				a += Cnk(j, x + 1)
				edge6.append(ep[j])
				x += 1

		var b = 0
		for j in range(5, 0, -1):
			var k = 0
			while edge6[j] != j:
				rotateLeft(edge6, 0, j)
				k += 1
			b = (j + 1) * b + k
		return 720 * a + b

	func setURtoDF(idx):
		var edge6 = [UR, UF, UL, UB, DR, DF]
		var otherEdge = [DL, DB, FR, FL, BL, BR]
		var b = idx % 720
		var a = floor(idx / 720)
		for i in edge_values:
			ep[i] = BR
		for j in range(1, 6):
			var k = b % (j + 1)
			b = floor(b / (j + 1))
			while k > 0:
				k -= 1
				rotateRight(edge6, 0, j)
		var x = 5

		for j in range(BR, -1, -1):
			if a - Cnk(j, x + 1) >= 0:
				ep[j] = edge6[x]
				a -= Cnk(j, x + 1)
				x -= 1
		x = 0

		for j in range(UR, BR + 1):
			if ep[j] == BR:
				ep[j] = otherEdge[x]
				x += 1

	func getURtoUL():
		var a = 0
		var x = 0
		var edge3 = []
		for j in range(UR, BR + 1):
			if ep[j] <= UL:
				a += Cnk(j, x + 1)
				edge3.append(ep[j])
				x += 1

		var b = 0
		for j in range(2, 0, -1):
			var k = 0
			while edge3[j] != j:
				rotateLeft(edge3, 0, j)
				k += 1
			b = (j + 1) * b + k
		return int(6 * a + b) & 0xffff

	func setURtoUL(idx):
		var edge3 = [UR, UF, UL]
		var b = idx % 6
		var a = floor(idx / 6)
		for i in edge_values:
			ep[i] = BR

		for j in range(1, 3):
			var k = b % (j + 1)
			b = floor(b / (j + 1))
			while k > 0:
				k -= 1
				rotateRight(edge3, 0, j)
		var x = 2
		for j in range(BR, -1, -1):
			if a - Cnk(j, x + 1) >= 0:
				ep[j] = edge3[x]
				a -= Cnk(j, x + 1)
				x -= 1

	func getUBtoDF():
		var a = 0
		var x = 0
		var edge3 = []
		for j in range(UR, BR + 1):
			if UB <= ep[j] and ep[j] <= DF:
				a += Cnk(j, x + 1)
				edge3.append(ep[j])
				x += 1

		var b = 0
		for j in range(2, 0, -1):
			var k = 0
			while edge3[j] != UB + j:
				rotateLeft(edge3, 0, j)
				k += 1
			b = (j + 1) * b + k
		return int(6 * a + b) & 0xffff

	func setUBtoDF(idx):
		var edge3 = [UB, DR, DF]
		var b = idx % 6
		var a = floor(idx / 6)
		for i in edge_values:
			ep[i] = BR

		for j in range(1, 3):
			var k = b % (j + 1)
			b = floor(b / (j + 1))
			while k > 0:
				k -= 1
				rotateRight(edge3, 0, j)
		var x = 2
		for j in range(BR, -1, -1):
			if a - Cnk(j, x + 1) >= 0:
				ep[j] = edge3[x]
				a -= Cnk(j, x + 1)
				x -= 1

	func getURFtoDLB():
		var perm = cp.duplicate()
		var b = 0
		for j in range(7, 0, -1):
			var k = 0
			while perm[j] != j:
				rotateLeft(perm, 0, j)
				k += 1
			b = (j + 1) * b + k
		return b

	func setURFtoDLB(idx):
		var perm = [URF, UFL, ULB, UBR, DFR, DLF, DBL, DRB]
		for j in range(1, 8):
			var k = idx % (j + 1)
			idx = floor(idx / (j + 1))
			while k > 0:
				k -= 1
				rotateRight(perm, 0, j)
		var x = 7
		for j in range(7, -1, -1):
			cp[j] = perm[x]
			x -= 1

	func getURtoBR():
		var perm = ep.duplicate()
		var b = 0
		for j in range(11, 0, -1):
			var k = 0
			while perm[j] != j:
				rotateLeft(perm, 0, j)
				k += 1
			b = (j + 1) * b + k
		return b

	func setURtoBR(idx):
		var perm = [UR, UF, UL, UB, DR, DF, DL, DB, FR, FL, BL, BR]
		for j in range(1, 12):
			var k = idx % (j + 1)
			idx = floor(idx / (j + 1))
			while k > 0:
				k -= 1
				rotateRight(perm, 0, j)
		var x = 11 
		for j in range(11, -1, -1):
			ep[j] = perm[x]
			x -= 1

	func verify():
		"""
		Check a cubiecube for solvability. Return the error code.
		0: Cube is solvable
		-2: Not all 12 edges exist exactly once
		-3: Flip error: One edge has to be flipped
		-4: Not all corners exist exactly once
		-5: Twist error: One corner has to be twisted
		-6: Parity error: Two corners ore two edges have to be exchanged
		"""

		var sum = 0
		var edgeCount = Helpers.init_empty_array(12)
		for i in edge_values:
			edgeCount[ep[i]] += 1
		for i in range(12):
			if edgeCount[i] != 1:
				return -2

		for i in range(12):
			sum += eo[i]
		if sum % 2 != 0:
			return -3

		var cornerCount = Helpers.init_empty_array(8)
		for i in corner_values:
			cornerCount[cp[i]] += 1
		for i in range(8):
			if cornerCount[i] != 1:
				return -4

		sum = 0
		for i in range(8):
			sum += co[i]
		if sum % 3 != 0:
			return -5

		if (edgeParity() ^ cornerParity()) != 0:
			return -6

		return 0

# ------------------------------------------------------------
# ------------------------ FaceCube --------------------------
# ------------------------------------------------------------

class FaceCube:
	var cornerFacelet = [
		[ U9, R1, F3 ],
		[ U7, F1, L3 ],
		[ U1, L1, B3 ],
		[ U3, B1, R3 ],
		[ D3, F9, R7 ],
		[ D1, L9, F7 ],
		[ D7, B9, L7 ],
		[ D9, R9, B7 ],
	]
	
	var edgeFacelet = [
		[ U6, R2 ], [ U8, F2 ],
		[ U4, L2 ], [ U2, B2 ],
		[ D6, R8 ], [ D2, F8 ],
		[ D4, L8 ], [ D8, B8 ],
		[ F6, R4 ], [ F4, L6 ],
		[ B6, L4 ], [ B4, R6 ],
	]
	
	var cornerColor = [
		[ U, R, F ], [ U, F, L ],
		[ U, L, B ], [ U, B, R ],
		[ D, F, R ], [ D, L, F ],
		[ D, B, L ], [ D, R, B ],
	]
	
	var edgeColor = [
		[ U, R ], [ U, F ], [ U, L ],
		[ U, B ], [ D, R ], [ D, F ],
		[ D, L ], [ D, B ], [ F, R ],
		[ F, L ], [ B, L ], [ B, R ],
	]
	
	var f
	
	func _init(cubeString = "UUUUUUUUURRRRRRRRRFFFFFFFFFDDDDDDDDDLLLLLLLLLBBBBBBBBB"):
		f = []
		for c in cubeString:
			f.append(colors[c])
	
	func to_String():
		var s = ""
		for c in f:
			s += color_keys[c]
		return s
	
	func toCubieCube():
		var ccRet = CubieCube.new()
		for i in range(8):
			ccRet.cp[i] = URF
		for i in range(12):
			ccRet.ep[i] = UR
	
		for i in corner_values:
			var ori
			for ori_c in range(3):
				ori = ori_c
				if (f[cornerFacelet[i][ori]] == U or f[cornerFacelet[i][ori]] == D):
					break
			var col1 = f[cornerFacelet[i][(ori + 1) % 3]]
			var col2 = f[cornerFacelet[i][(ori + 2) % 3]]
			
			for j in corner_values:
				if (col1 == cornerColor[j][1] and col2 == cornerColor[j][2]):
					ccRet.cp[i] = j
					ccRet.co[i] = ori % 3
					break
		
		for i in edge_values:
			for j in edge_values:
				if (f[edgeFacelet[i][0]] == edgeColor[j][0] and f[edgeFacelet[i][1]] == edgeColor[j][1]):
					ccRet.ep[i] = j
					ccRet.eo[i] = 0
					break
				
				if (f[edgeFacelet[i][0]] == edgeColor[j][1] and f[edgeFacelet[i][1]] == edgeColor[j][0]):
					ccRet.ep[i] = j
					ccRet.eo[i] = 1
					break
		
		return ccRet

# ------------------------------------------------------------
# ------------------------ Helpers ---------------------------
# ------------------------------------------------------------

class Helpers:
	var cpU = [UBR, URF, UFL, ULB, DFR, DLF, DBL, DRB]
	var coU = [0, 0, 0, 0, 0, 0, 0, 0]
	var epU = [UB, UR, UF, UL, DR, DF, DL, DB, FR, FL, BL, BR]
	var eoU = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]

	var cpR = [DFR, UFL, ULB, URF, DRB, DLF, DBL, UBR]
	var coR = [2, 0, 0, 1, 1, 0, 0, 2]
	var epR = [FR, UF, UL, UB, BR, DF, DL, DB, DR, FL, BL, UR]
	var eoR = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
	var cpF = [UFL, DLF, ULB, UBR, URF, DFR, DBL, DRB]
	var coF = [1, 2, 0, 0, 2, 1, 0, 0]
	var epF = [UR, FL, UL, UB, DR, FR, DL, DB, UF, DF, BL, BR]
	var eoF = [0, 1, 0, 0, 0, 1, 0, 0, 1, 1, 0, 0]
	var cpD = [URF, UFL, ULB, UBR, DLF, DBL, DRB, DFR]
	var coD = [0, 0, 0, 0, 0, 0, 0, 0]
	var epD = [UR, UF, UL, UB, DF, DL, DB, DR, FR, FL, BL, BR]
	var eoD = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
	var cpL = [URF, ULB, DBL, UBR, DFR, UFL, DLF, DRB]
	var coL = [0, 1, 2, 0, 0, 2, 1, 0]
	var epL = [UR, UF, BL, UB, DR, DF, FL, DB, FR, UL, DL, BR]
	var eoL = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
	var cpB = [URF, UFL, UBR, DRB, DFR, DLF, ULB, DBL]
	var coB = [0, 0, 1, 2, 0, 0, 2, 1]
	var epB = [UR, UF, UL, BR, DR, DF, DL, BL, FR, FL, UB, DB]
	var eoB = [0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 1, 1]

	var moveCube = [
		CubieCube.new(cpU, coU, epU, eoU),
		CubieCube.new(cpR, coR, epR, eoR),
		CubieCube.new(cpF, coF, epF, eoF),
		CubieCube.new(cpD, coD, epD, eoD),
		CubieCube.new(cpL, coL, epL, eoL),
		CubieCube.new(cpB, coB, epB, eoB),
	]
	
	static func init_empty_array(lenght, value = 0):
		var arr = []
		for _i in range(lenght):
			arr.append(value)
		return arr
	
	static func getPruning(table, index):
		var res
		if ((int(index) & 1) == 0):
			res = int(table[floor(index / 2)]) & 0x0f
		else:
			res = (int(table[floor(index / 2)]) & 0xf0) >> 4
		return res

# ------------------------------------------------------------
# ------------------------ Tools -----------------------------
# ------------------------------------------------------------

class Tools:
	var rng = RandomNumberGenerator.new()

	func verify(s):
		var count = Helpers.init_empty_array(6)
		
		for i in range(54):
			count[colors[s[i]]] += 1
		
		for i in range(6):
			if count[i] != 9:
				return -1
		
		var fc = FaceCube.new(s)
		var cc = fc.toCubieCube()
		return cc.verify()

	func randomCube(Pruning):
		#var Pruning = get_node("/root/Pruning")
		rng.randomize()
		var cc = CubieCube.new()
		cc.setFlip(rng.randi_range(0, Pruning.N_FLIP - 1))
		cc.setTwist(rng.randi_range(0, Pruning.N_TWIST - 1))
		while true:
			cc.setURFtoDLB(rng.randi_range(0, Pruning.N_URFtoDLB - 1))
			cc.setURtoBR(rng.randi_range(0, Pruning.N_URtoBR - 1))
			
			if (cc.edgeParity() ^ cc.cornerParity()) == 0:
				break
		var fc = cc.toFaceCube()
		return fc.to_String()

	func randomLastLayerCube():
		rng.randomize()
		var cc = CubieCube.new()
		cc.setFlip([0, 24, 40, 48, 72, 80, 96, 120][rng.randi_range(0, 7)])
		cc.setTwist(rng.randi_range(0, 26))
		while true:
			var perms = [0, 624, 3744, 3840, 4344, 4440, 26064, 26160, 26664, 26760,
				27360, 27984, 30384, 30480, 30984, 31080, 31680, 32304, 35304,
				35400, 36000, 36624, 39744, 39840]
			cc.setURFtoDLB(perms[rng.randi_range(0, perms.size() - 1)])
			cc.setURtoBR(perms[rng.randi_range(0, perms.size() - 1)])
			
			if (cc.edgeParity() ^ cc.cornerParity()) == 0:
				break
		var fc = cc.toFaceCube()
		return fc.to_String()

# ------------------------------------------------------------
# ------------------------ Search ----------------------------
# ------------------------------------------------------------

class Search:
	var ax
	var po
	var flip
	var twist
	var slice
	var parity
	var URFtoDLF
	var FRtoBR
	var URtoUL
	var UBtoDF
	var URtoDF
	var minDistPhase1
	var minDistPhase2
	
	var ax_to_s = ["U", "R", "F", "D", "L", "B"]
	var po_to_s = [null, " ", "2 ", "' "]
	
	func _init():
		ax = Helpers.init_empty_array(31)
		po = Helpers.init_empty_array(31)
		flip = Helpers.init_empty_array(31)
		twist = Helpers.init_empty_array(31)
		slice = Helpers.init_empty_array(31)
		parity = Helpers.init_empty_array(31)
		URFtoDLF = Helpers.init_empty_array(31)
		FRtoBR = Helpers.init_empty_array(31)
		URtoUL = Helpers.init_empty_array(31)
		UBtoDF = Helpers.init_empty_array(31)
		URtoDF = Helpers.init_empty_array(31)
		minDistPhase1 = Helpers.init_empty_array(31)
		minDistPhase2 = Helpers.init_empty_array(31)
	
	func solutionToString(length, depthPhase1 = null):
		var s = ""
		for i in range(length):
			s += ax_to_s[ax[i]]
			s += po_to_s[po[i]]
			if depthPhase1 != null and i == depthPhase1 - 1:
				s += ". "
		return s
	
	func solution(facelets, maxDepth, timeOut, useSeparator, Pruning):
		var fc = FaceCube.new(facelets)
		var cc = fc.toCubieCube()
		var s = cc.verify()
		
		if s != 0:
			return [
				'Error: There is not exactly one facelet of each colour',
				'Error: Not all 12 edges exist exactly once',
				'Error: Flip error: One edge has to be flipped',
				'Error: Not all corners exist exactly once',
				'Error: Twist error: One corner has to be twisted',
				'Error: Parity error: Two corners or two edges have to be exchanged',
				'Error: No solution exists for the given maxDepth',
				'Error: Timeout, no solution within given time',
			][s - 1]
			
		var c = CoordCube.new(cc)
		
		po[0] = 0
		ax[0] = 0
		flip[0] = c.flip
		twist[0] = c.twist
		parity[0] = c.parity
		slice[0] = floor(c.FRtoBR / 24)
		URFtoDLF[0] = c.URFtoDLF
		FRtoBR[0] = c.FRtoBR
		URtoUL[0] = c.URtoUL
		UBtoDF[0] = c.UBtoDF
		
		minDistPhase1[1] = 1
		
		var mv = 0
		var n = 0
		var busy = false
		var depthPhase1 = 1
		
		var tStart = OS.get_ticks_msec()
		
		while true:
			while true:
				if depthPhase1 - n > minDistPhase1[n + 1] and not busy:
					if ax[n] == 0 or ax[n] == 3:   # Initialize next move
						n += 1
						ax[n] = 1
					else:
						n += 1
						ax[n] = 0
					po[n] = 1
				else:
					po[n] += 1
					if po[n] > 3:
						while true:
							ax[n] += 1
							if ax[n] > 5:
								if (OS.get_ticks_msec() - tStart) / 1000.0 > timeOut:
									return "Error: Timeout, no solution within given time "
								if n == 0:
									if depthPhase1 >= maxDepth:
										return "Error: No solution exists for the given maxDepth"
									else:
										depthPhase1 += 1
										ax[n] = 0
										po[n] = 1
										busy = false
										break
								else:
									n -= 1
									busy = true
									break
							else:
								po[n] = 1
								busy = false
							if not (n != 0 and (ax[n - 1] == ax[n] or ax[n - 1] - 3 == ax[n])):
								break
					else:
						busy = false
				if not busy:
					break
	
			mv = 3 * ax[n] + po[n] - 1
			flip[n + 1] = Pruning.flipMove[flip[n]][mv]
			twist[n + 1] = Pruning.twistMove[twist[n]][mv]
			slice[n + 1] = floor(Pruning.FRtoBR_Move[slice[n] * 24][mv] / 24)
			minDistPhase1[n + 1] = max(
				Helpers.getPruning(
					Pruning.Slice_Flip_Prun,
					Pruning.N_SLICE1 * flip[n + 1] + slice[n + 1]
				),
				Helpers.getPruning(
					Pruning.Slice_Twist_Prun,
					Pruning.N_SLICE1 * twist[n + 1] + slice[n + 1]
				)
			)
			
			if minDistPhase1[n + 1] == 0 and n >= depthPhase1 - 5:
				minDistPhase1[n + 1] = 10
				if n == depthPhase1 - 1:
					s = totalDepth(depthPhase1, maxDepth, Pruning)
					if s >= 0:
						if (s == depthPhase1 or (ax[depthPhase1 - 1] != ax[depthPhase1] and ax[depthPhase1 - 1] != ax[depthPhase1] + 3)):
							return solutionToString(s, depthPhase1) if useSeparator else solutionToString(s)
	
	func totalDepth(depthPhase1, maxDepth, Pruning):
		var mv = 0
		var d1 = 0
		var d2 = 0
		var maxDepthPhase2 = min(10, maxDepth - depthPhase1)
		for i in range(depthPhase1):
			mv = 3 * ax[i] + po[i] - 1
			URFtoDLF[i + 1] = Pruning.URFtoDLF_Move[URFtoDLF[i]][mv]
			FRtoBR[i + 1] = Pruning.FRtoBR_Move[FRtoBR[i]][mv]
			parity[i + 1] = Pruning.parityMove[parity[i]][mv]
		
		d1 = Helpers.getPruning(
			Pruning.Slice_URFtoDLF_Parity_Prun,
			(Pruning.N_SLICE2 * URFtoDLF[depthPhase1] + FRtoBR[depthPhase1]) * 2 + parity[depthPhase1]
		)
		if d1 > maxDepthPhase2:
			return -1
		
		for i in range(depthPhase1):
			mv = 3 * ax[i] + po[i] - 1
			URtoUL[i + 1] = Pruning.URtoUL_Move[URtoUL[i]][mv]
			UBtoDF[i + 1] = Pruning.UBtoDF_Move[UBtoDF[i]][mv]
		
		URtoDF[depthPhase1] = Pruning.MergeURtoULandUBtoDF[URtoUL[depthPhase1]][UBtoDF[depthPhase1]]
		
		d2 = Helpers.getPruning(
			Pruning.Slice_URtoDF_Parity_Prun,
			(Pruning.N_SLICE2 * URtoDF[depthPhase1] + FRtoBR[depthPhase1]) * 2 + parity[depthPhase1]
		)
		if d2 > maxDepthPhase2:
			return -1
		
		minDistPhase2[depthPhase1] = max(d1, d2)
		if minDistPhase2[depthPhase1] == 0:    # already solved
			return depthPhase1
	
		var depthPhase2 = 1
		var n = depthPhase1
		var busy = false
		po[depthPhase1] = 0
		ax[depthPhase1] = 0
		minDistPhase2[n + 1] = 1   # else failure for depthPhase2=1, n=0
	
		while true:
			while true:
				if depthPhase1 + depthPhase2 - n > minDistPhase2[n + 1] and not busy:
					
					if ax[n] == 0 or ax[n] == 3:    # Initialize next move
						n += 1
						ax[n] = 1
						po[n] = 2
					else:
						n += 1
						ax[n] = 0
						po[n] = 1
				else:
					var temp
					if ax[n] == 0 or ax[n] == 3:
						po[n] += 1
						temp = (po[n] > 3)
					else:
						po[n] += 2
						temp = (po[n] > 3)
					if temp:
						while true:
							ax[n] += 1
							if ax[n] > 5:
								if n == depthPhase1:
									if depthPhase2 >= maxDepthPhase2:
										return -1
									else:
										depthPhase2 += 1
										ax[n] = 0
										po[n] = 1
										busy = false
										break
								else:
									n -= 1
									busy = true
									break
							else:
								if ax[n] == 0 or ax[n] == 3:
									po[n] = 1
								else:
									po[n] = 2
								busy = false
							if not (n != depthPhase1 and (ax[n - 1] == ax[n] or ax[n - 1] - 3 == ax[n])):
								break
					else:
						busy = false
				if not busy:
					break
			
			mv = 3 * ax[n] + po[n] - 1
			
			URFtoDLF[n + 1] = Pruning.URFtoDLF_Move[URFtoDLF[n]][mv]
			FRtoBR[n + 1] = Pruning.FRtoBR_Move[FRtoBR[n]][mv]
			parity[n + 1] = Pruning.parityMove[parity[n]][mv]
			URtoDF[n + 1] = Pruning.URtoDF_Move[URtoDF[n]][mv]
			
			minDistPhase2[n + 1] = max(
				Helpers.getPruning(
					Pruning.Slice_URtoDF_Parity_Prun,
					(Pruning.N_SLICE2 * URtoDF[n + 1] + FRtoBR[n + 1]) * 2 + parity[n + 1]
				),
				Helpers.getPruning(
					Pruning.Slice_URFtoDLF_Parity_Prun,
					(Pruning.N_SLICE2 * URFtoDLF[n + 1] + FRtoBR[n + 1]) * 2 + parity[n + 1]
				)
			)
			
			if minDistPhase2[n + 1] == 0:
				break
		
		return depthPhase1 + depthPhase2
	
	static func patternize(facelets, pattern):
		var facelets_cc = FaceCube.new(facelets).toCubieCube()
		var patternized_cc = CubieCube.new()
		FaceCube.new(pattern).toCubieCube().invCubieCube(patternized_cc)
		patternized_cc.multiply(facelets_cc)
		return patternized_cc.toFaceCube().to_String()

const DEFAULT_PATTERN = 'UUUUUUUUURRRRRRRRRFFFFFFFFFDDDDDDDDDLLLLLLLLLBBBBBBBBB'

static func solve(cubestring = DEFAULT_PATTERN, patternstring = null, Pruning = null, max_depth = 24):
	cubestring = Search.patternize(cubestring, patternstring) if patternstring != null else cubestring
	var search = Search.new()
	var solution = search.solution(cubestring, max_depth, 30.0, 0, Pruning)
	return solution
