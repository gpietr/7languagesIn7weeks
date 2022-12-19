object TicTacToe {
    def main(args: Array[String]) = {
        val board = parse(args(0))

        println(printToString(board))

        val winner = determineWinner(board)

        println(s"Winner: $winner")
    }
}


type Board = Array[Array[Option[Field]]]

def printToString(board: Board) : String = {
    val resultBuilder = new StringBuilder();
    resultBuilder ++= fieldToString(board(0)(0))
    resultBuilder ++= fieldToString(board(0)(1))
    resultBuilder ++= fieldToString(board(0)(2))
    resultBuilder ++= "\r\n"
    resultBuilder ++= fieldToString(board(1)(0))
    resultBuilder ++= fieldToString(board(1)(1))
    resultBuilder ++= fieldToString(board(1)(2))
    resultBuilder ++= "\r\n"
    resultBuilder ++= fieldToString(board(2)(0))
    resultBuilder ++= fieldToString(board(2)(1))
    resultBuilder ++= fieldToString(board(2)(2))
    resultBuilder ++= "\r\n"
    return resultBuilder.toString()
}

def determineWinner(board: Board) : Option[Field] = {
    def isRowEqual(row: Array[Option[Field]]) : Boolean = row(0) == row(1) && row(1) == row(2)
    
    def isColumnEqual(board: Board, column: Int) : Boolean = board(0)(column) == board(1)(column) && board(1)(column) == board(2)(column)


    if(isRowEqual(board(0))) {
        return board(0)(0)
    }
    if(isRowEqual(board(1))) {
        return board(1)(0)
    } 
    if(isRowEqual(board(2))) {
        return board(2)(0)
    }
    if(isColumnEqual(board, 0)){
        return board(0)(0)
    }
    if(isColumnEqual(board, 1)){
        return board(0)(1)
    }
    if(isColumnEqual(board, 2)){
        return board(0)(2)
    }

    if(board(0)(0) == board(1)(1) && board(1)(1) == board(2)(2)){
        return board(1)(1)
    }
    if(board(0)(2) == board(1)(1) && board(1)(1) == board(2)(0)){
        return board(1)(1)
    }
    return None
}

def parse(input: String) : Board = {
    val split = input.split(",")
    val result = Array.ofDim[Option[Field]](3, 3);

    def parseChar(char: String) : Option[Field] = char match
        case "X" => Some(Field.X)
        case "O" => Some(Field.O)
        case _ => None

    result(0)(0) = parseChar(split(0))
    result(0)(1) = parseChar(split(1))
    result(0)(2) = parseChar(split(2))
    result(1)(0) = parseChar(split(3))
    result(1)(1) = parseChar(split(4))
    result(1)(2) = parseChar(split(5))
    result(2)(0) = parseChar(split(6))
    result(2)(1) = parseChar(split(7))
    result(2)(2) = parseChar(split(8))
    return result
}

def fieldToString(value: Option[Field]): String = value match
        case Some(aValue) => aValue match
            case Field.X => "X"
            case Field.O => "O"
        case _ => " "

enum Field:
  case X, O