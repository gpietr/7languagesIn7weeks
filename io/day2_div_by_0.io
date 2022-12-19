originalDiv := Number getSlot("/")

Number / := method(i, if(i == 0, 0, originalDiv(self, i)))


(5 / 5) println
(5 / 0) println