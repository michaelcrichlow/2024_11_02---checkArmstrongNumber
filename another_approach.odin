package test

import "core:fmt"
import "core:math"
print :: fmt.println

main :: proc() {

	print(checkArmstrongNumber(153))
	// OUTPUT:
	// true
}


checkArmstrongNumber :: proc(n: int) -> bool {
	if n < 100 || n > 999 {
		panic("Invalid number. Number must be 3 digits long.")
	}

	// In Odin, all procedure parameters are immutable. 
	// So, to change a value, make a local copy. 
	_n := n

	local_array: [dynamic]int
	defer delete(local_array)

	div, mod := 1_000, 0 // just to pick some starting values >_<
	for div > 0 {
		div, mod = math.divmod(_n, 10)
		append(&local_array, mod)
		_n = div
	}

	for &val in local_array {
		val = val * val * val
	}

	return sum_iterable(local_array[:]) == n
}
