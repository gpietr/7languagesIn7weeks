fibonacciRecursive := method(
    number,
    if(number <= 1, 1, fibonacciRecursive(number - 1) + fibonacciRecursive(number - 2))
)


fibonacciIterative := method(
    number,
    antepenultimate := 0
    penultimate := 1
    for(num, penultimate, number,
        val := antepenultimate + penultimate
        antepenultimate = penultimate
        penultimate = val
    )
    penultimate
)

fibonacciRecursive(5) println

fibonacciIterative(5) println