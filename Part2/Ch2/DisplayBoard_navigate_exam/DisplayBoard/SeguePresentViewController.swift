//
//  SeguePresentViewController.swift
//  DisplayBoard
//
//  Created by choi hyunjin on 2022/01/27.
//

import UIKit

class SeguePresentViewController: UIViewController {
    @IBAction func pressBackButton(_ sender: UIButton) {
        print("SeguePresentViewController")
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
}
