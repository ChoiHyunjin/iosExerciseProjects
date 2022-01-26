//
//  ViewController.swift
//  QuotesGenerator
//
//  Created by choi hyunjin on 2022/01/26.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var quoteLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    var quotes = [Quote(content: "죽음을 두려워하는 나머지 삶을 시작조차 못하는 사람이 많다.", author: "")]
    var quoteIndex = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.changeQuote()
        
        self.quotes.append(contentsOf: [
            Quote(content: "꿈을 이루고자 하는 용기만 있다면 모든 꿈을 이룰 수 있다.", author: "월트 디즈니"),
            Quote(content: "비록 해가 진다고 해도, 나에게는 전기불이 있다.", author: "로커 커트 코베인"),
            Quote(content: "웃음이 없는 하루는 버린 하루다.", author: "찰리 채플린"),
            Quote(content: "우리는 한 번도 존재하지 않았던 것을 꿈꿀 수 있는 사람들이 필요하다.", author: "존 F. 케네디"),
            Quote(content: "변화는 우리가 누군가나 무엇, 혹은 후일을 기다린다고 찾아오지 않는다. 우리 자신이 우리가 기다리던 사람이고 우리가 바로 우리가 추구하는 변화이다.", author: "버락 오바마"),
            Quote(content: "무슨 일을 하기 전에는 그 일에 대해 기대를 가져야 한다.", author: "마이클 조던"),
            Quote(content: "행동은 모든 성공의 가장 기초적인 핵심이다.", author: "파블로 피카소"),
        ])
    }
    func changeQuote() {
        var index = 0
        repeat {
            index = Int(arc4random_uniform(UInt32(self.quotes.count)))
        } while index == self.quoteIndex
        self.quoteIndex = index
        
        let quote = self.quotes[index]
        self.quoteLabel.text = quote.content
        self.authorLabel.text = quote.author
    }
    
    @IBAction func whenPressChangeButton(_ sender: Any) {
        self.changeQuote()
    }
    

}

