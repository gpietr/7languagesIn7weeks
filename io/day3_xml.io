OperatorTable addAssignOperator(":", "atPutVal")

curlyBrackets := method(
    r := Map clone
    call message arguments foreach(arg,
        r doMessage(arg)
    )
    r
)

Map atPutVal := method(
    self atPut(
        call evalArgAt(0) asMutable removePrefix("\"") removeSuffix("\""),
        call evalArgAt(1)
    )
)

test := doString("{ 
    \"test\" : \"ttt\", 
    \"another\" : \"123455\" 
}")


Builder := Object clone
Builder indent := 0

writeSpaces := method(number,
    for(i, 0, number, write(" "))
)

writeMap := method(map,
    res := ""
    if(map != nil and map size > 0, res = " "; map map(k, v, res = res .. k .. "=" .. v) join)
    res
)

Builder forward := method(param,
    writeSpaces(self indent)
    writeln("<", call message name, writeMap(param), ">")
    self indent = indent + 1
    call message arguments foreach(
        arg,
        if(arg != param,
            content := self doMessage(arg)
            if(content type == "Sequence", writeSpaces(self indent); writeln(content))
        )
    )
    self indent = indent - 1
    writeSpaces(self indent)
    writeln("</", call message name, ">")
)


newBuiler := Builder clone

newBuiler sayHi := method("Hi" println)

builder2 := Builder clone


doFile("myhtml")