object Program extends Censor {
    def main(args: Array[String]) = {
        println(censor("I'm gonna shoot these darn programmers"))
    }
}

trait Censor:
    val curseWordDictionary = Map("shoot" -> "pucky", "darn" -> "beans")

    def censor(input: String) : String = {
        def censorWord(input: String, word: String, replacement: String) : String = input.replaceAll(word, replacement)

        curseWordDictionary.foldLeft(input){ case(currentString, (word, replacement)) => censorWord(currentString, word, replacement) }
    }