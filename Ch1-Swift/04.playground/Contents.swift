import UIKit

var greeting = "Hello, playground"


func split(_ s: String, _ word: String) -> [String]{
    var i: String.Index? = s.startIndex
    var j: String.Index
    var string = s
    while i != nil && i!<string.endIndex {
        i = string.firstIndex(of: word.first!)
        if i != nil {
            j = i!
            for ch in word{
                let temp = string.index(after: j)
                if ch == string[temp]{
                    j = temp
                }
            }
            if j == string.index(i!, offsetBy: word.count){
                break
            }else{
                string = String(string[string.startIndex...i!])
            }
        }
    }
    if i == nil {
        return [s]
    }else {
        return [String(s[s.startIndex..<i!]), String(s[s.index(after: j)..<s.endIndex])]
    }
}
