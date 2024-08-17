numberArray = [3, 2, 5, 1, 8, 9, 6]
evenNumberArray = []
oddNumberArray = []
sortedArray = []
temp = 0


def split_even_odd_number(number_arr):  # function to split array based on even or odd number
    for i in range(len(number_arr) - 1):
        if number_arr[i] % 2 == 0:
            evenNumberArray.append(number_arr[i])
        else:
            oddNumberArray.append(number_arr[i])


def sort_descending(number_arr):  # function to sort array
    for i in range(len(number_arr)-1):
        for j in range(i+1, len(number_arr)):
            if number_arr[i] < number_arr[j]:
                temp = number_arr[i]
                number_arr[i] = number_arr[j]
                number_arr[j] = temp


def join_array():  # function to join even and odd sorted array
    sortedArray.extend(evenNumberArray)
    sortedArray.extend(oddNumberArray)


print(f"The input array is: {numberArray}")
split_even_odd_number(numberArray)
sort_descending(evenNumberArray)
sort_descending(oddNumberArray)
join_array()
print(f"The sorted array is: {sortedArray}")





