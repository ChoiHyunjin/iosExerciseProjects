//
//  ViewController.swift
//  LEDBoard
//
//  Created by choi hyunjin on 2022/01/28.
//

import UIKit

class ViewController: UIViewController, LEDBoardSettingDelegate {
	func changeSetting(text: String?, textColor: UIColor, backgroundColor: UIColor) {
		self.contentLabel.text = text
		self.contentLabel.textColor = textColor
		self.view.backgroundColor = backgroundColor
	}
	
    @IBOutlet weak var contentLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.contentLabel.textColor = .yellow
    }
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if let vc = segue.destination as? SettingViewController{
			vc.delegate = self
			vc.ledText = self.contentLabel.text
			vc.textColor = self.contentLabel.textColor
			vc.backgroundColor = self.view.backgroundColor ?? .black
		}
	}

	
}

