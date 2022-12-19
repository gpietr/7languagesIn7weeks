TestClass := Object clone

TestClass testMethod := method(arg, ("test2" .. arg) println)

TestClass anotherMethod := method("another\n" print)

TestClass counter := 0

TestClass increment := method(counter = counter + 1)

test := TestClass clone

"Now testing\n" print

test testMethod(5)

methodByString := test getSlot("anotherMethod")

methodByString()


test increment
test increment

test counter println



test2 := TestClass clone

test2 increment

test2 counter println


test counter println