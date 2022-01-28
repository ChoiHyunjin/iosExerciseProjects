//
//  CodePushViewController.swift
//  DisplayBoard
//
//  Created by choi hyunjin on 2022/01/27.
//

import UIKit

class CodePushViewController: UIViewController {
    
    weak var delegate : SendDataDelegate?
    var name: String = "CodePushViewController"

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func pressBackButton(_ sender: UIButton) {
        print("CodePushViewController")
        self.delegate?.sendData(name: self.name)
        self.navigationController?.popViewController(animated: true)
    }
}
