//
//  ViewController.swift
//  DisplayBoard
//
//  Created by choi hyunjin on 2022/01/26.
//

import UIKit

class ViewController: UIViewController, SendDataDelegate {
    @IBOutlet weak var label: UILabel!
    var name: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = "init"
        // Do any additional setup after loading the view.
    }

    @IBAction func pressPushByCode(_ sender: UIButton) {
        guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: "CodePushViewController") as? CodePushViewController else {return}
        viewController.delegate = self
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    @IBAction func pressPresentByCode(_ sender: UIButton) {
        guard let codePresentVC = self.storyboard?.instantiateViewController(withIdentifier: "CodePresentViewController") as? CodePresentViewController else {
            return
        }
        codePresentVC.modalPresentationStyle = .fullScreen
        codePresentVC.delegate = self
        self.present(codePresentVC, animated: true)
    }
    
    func sendData(name: String) {
        self.label.text = name
        self.label.sizeToFit()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segue 전에 자동으로 호출
        if let VC = segue.destination as? SeguePushViewController {
            VC.nameLabel.text = "prepare"
        }
    }
}

