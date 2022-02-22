//
//  SeguePushViewController.swift
//  DisplayBoard
//
//  Created by choi hyunjin on 2022/01/27.
//

import UIKit

class SeguePushViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBAction func pressBackButton(_ sender: UIButton) {
        print("SeguePushViewController")
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
