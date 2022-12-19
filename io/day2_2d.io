FunkyArray := Object clone

FunkyArray dim := method(x, y,
    self _list := list()
    self _list setSize(x)
    for(i, 0, x - 1,
        item := list()
        item setSize(y)
        self _list atPut(i, item)
    )
)


FunkyArray get := method(x, y, _list at(x) at(y))

FunkyArray set := method(x, y, val, _list at(x) atPut(y, val))


FunkyArray toFile := method(fileName,
    f := File with(fileName)
    f remove
    f openForUpdating
    _list foreach(subList, 
        subList foreach(item, 
            f write(if(item == nil, "nil", item));
            f write(" ");)
        f write("\n")
    )
    f close
)


instance := FunkyArray clone

instance dim(10, 5)

instance set(2, 2, "test")

instance get(2, 2) println
instance get(2, 5) println


instance toFile("testFile.txt")