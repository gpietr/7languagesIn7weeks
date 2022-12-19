numbers := list(1, 2, 3, 4, 5)

List sum := method(
    res := 0
    self foreach(v, res = res + v)
    res    
)


List myAverage := method(
    if(self size == 0, Exception raise("FU!"))
    self sum / self size
)

numbers sum println

numbers myAverage println


list() myAverage