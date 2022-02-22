//
//  SettingViewController.swift
//  LEDBoard
//
//  Created by choi hyunjin on 2022/01/28.
//

import UIKit

protocol LEDBoardSettingDelegate :AnyObject {
    func changeSetting(text: String?, textColor: UIColor, backgroundColor: UIColor)
}

class SettingViewController: UIViewController {
	@IBOutlet weak var textField: UITextField!
	
	@IBOutlet weak var yellowButton: UIButton!
	@IBOutlet weak var purpleButton: UIButton!
	@IBOutlet weak var greenButton: UIButton!
	
	@IBOutlet weak var blackButton: UIButton!
	@IBOutlet weak var blueButton: UIButton!
	@IBOutlet weak var orangeButton: UIButton!
	
	weak var delegate : LEDBoardSettingDelegate?
	var textColor: UIColor = .yellow
	var backgroundColor: UIColor = .black
	var ledText : String?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.initData()
	}
	
	func initData(){
		guard self.ledText != nil else {return}
		self.textField.text = self.ledText
		self.changeTextColor(color: self.textColor)
		self.changeBackgroundColor(color: self.backgroundColor)
	}
	
	@IBAction func tapTextColorButton(_ sender: UIButton) {
			var color : UIColor?
			if sender == self.yellowButton {
					color = UIColor.yellow
			}else if sender == self.purpleButton {
					color = UIColor.purple
			}else if sender == self.greenButton {
					color = UIColor.green
			}
			guard color != nil else {
					return
			}
			self.textColor = color!
			self.changeTextColor(color: color!)
	}
	
	@IBAction func tabBackgroundColorButton(_ sender: UIButton) {
			var color : UIColor?
			if sender == self.blackButton {
					color = UIColor.black
			}else if sender == self.blueButton {
					color = UIColor.blue
			}else if sender == self.orangeButton {
					color = UIColor.orange
			}
			guard color != nil else {
					return
			}
			self.backgroundColor = color!
			self.changeBackgroundColor(color: color!)
	}
	@IBAction func tapSaveButton(_ sender: UIButton) {
			self.delegate?.changeSetting(text: self.textField.text, textColor: self.textColor, backgroundColor: self.backgroundColor)
	}
	
	private func changeTextColor(color: UIColor){
			self.yellowButton.alpha = color == UIColor.yellow ? 1 : 0.2
			self.purpleButton.alpha = color == UIColor.purple ? 1 : 0.2
			self.greenButton.alpha = color == UIColor.green ? 1 : 0.2
	}
	
	private func changeBackgroundColor(color: UIColor){
		self.blackButton.alpha = color == UIColor.black ? 1 : 0.2
		self.blueButton.alpha = color == UIColor.blue ? 1 : 0.2
		self.orangeButton.alpha = color == UIColor.orange ? 1 : 0.2
		
	}
    
    
}
