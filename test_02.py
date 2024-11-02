def checkArmstrongNumber(n: int) -> bool:
    n_as_string = str(n)
    if len(n_as_string) != 3:
        raise Exception("Invalid number. Number must be 3 digits long.")

    local_array: list[int] = []
    for val in n_as_string:
        local_array.append(int(val))

    local_array_values_cubed: list[int] = []
    for val1 in local_array:
        local_array_values_cubed.append(val1 * val1 * val1)

    total = sum(local_array_values_cubed)

    return total == n


def main() -> None:
    print(checkArmstrongNumber(153))


if __name__ == '__main__':
    main()

# checkArmstrongNumber(153) => true
