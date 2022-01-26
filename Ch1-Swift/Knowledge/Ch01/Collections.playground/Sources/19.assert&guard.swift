import Foundation

func guardTest(_ value: Int?){
    guard value == nil else {
        print("value is nil")
        return
    }
    print("value:", value)
}
