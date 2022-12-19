unless := method(call sender doMessage(call message argAt(0)) ifFalse(
    call sender doMessage(call message argAt(1))) ifTrue(
        call sender doMessage(call message argAt(2)))
)

unless(true, "not tru" println, "tru" println)
unless(false, "not tru" println, "tru" println)


testText := "test text"

test := method(call sender testText println)


test()