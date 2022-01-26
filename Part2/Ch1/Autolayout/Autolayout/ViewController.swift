//
//  ViewController.swift
//  Autolayout
//
//  Created by choi hyunjin on 2022/01/26.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var ColorView: UIView!
    @IBAction func tabChangeColorButton(_ sender: UIButton) {
        self.ColorView.backgroundColor = UIColor.red
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

