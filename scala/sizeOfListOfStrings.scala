object Program {
    def main(args: Array[String]) = {
        println(CalculateTotalSize(List("aaa", "b", "cc")))
    }
}

def CalculateTotalSize(list: List[String]) : Int = list.foldLeft(0)((sum, string) => sum + string.length)
