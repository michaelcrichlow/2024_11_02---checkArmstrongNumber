package test

import "core:fmt"
print :: fmt.println

main :: proc() {

	print(checkArmstrongNumber(153))

	// OUTPUT:
	// true
}


checkArmstrongNumber :: proc(n: int) -> bool {
	// creation of a string allocates memory, so you have to delete() it later
	n_as_string := str(n)
	defer delete(n_as_string)

	if len_characters(n_as_string) != 3 {
		// Odin doesn't have exceptions
		panic("Invalid number. Number must be 3 digits long.")
	}

	// creation of a dynamic array allocates memory, so you need to delete() it later*
	// *(ACTUALLY, *adjusts glasses* it's not the creation of the dynamic array that allocates memory, but
	// each subsequent append() that allocates memory (if you want to be pedantic.)
	// Regardless, you end up in the same place. Still need to delete() it later.)
	local_array: [dynamic]int
	defer delete(local_array)

	for val in n_as_string {
		val_as_int, ok := int_cast(val)
		if !ok {
			print("Could not convert rune", val, "to integer.")
			panic("")
		}

		append(&local_array, val_as_int)
	}

	// you can change values directly with &val
	for &val in local_array {
		val = val * val * val
	}

	total := sum_iterable(local_array[:])

	return total == n
}
