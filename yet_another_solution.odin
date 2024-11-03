package test

import "core:fmt"
import "core:math"
print :: fmt.println

main :: proc() {

	print(checkArmstrongNumber(153))
	// OUTPUT:
	// true
}


// This solution doesn't allocate memory on the heap
checkArmstrongNumber :: proc(n: int) -> bool {
	if n < 100 || n > 999 {
		panic("Invalid number. Number must be 3 digits long.")
	}

	// In Odin, all procedure parameters are immutable. 
	// So, to change a value, make a local copy. 
	_n := n
	total := 0

	div, mod := 1_000, 0 // just to pick some starting values >_<

	for div > 0 {
		div, mod = math.divmod(_n, 10)
		mod = mod * mod * mod
		total += mod
		_n = div
	}

	return total == n
}
