//
//  CodePresentViewController.swift
//  DisplayBoard
//
//  Created by choi hyunjin on 2022/01/27.
//

import UIKit

protocol SendDataDelegate : AnyObject{
    func sendData(name: String)
}

class CodePresentViewController: UIViewController {

    weak var delegate : SendDataDelegate?
    var name: String = "CodePresentViewController"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    @IBAction func pressGoBack(_ sender: UIButton) {
        print("CodePresentViewController")
        self.delegate?.sendData(name: self.name)
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    

}
