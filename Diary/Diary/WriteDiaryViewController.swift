//
//  WriteDiaryViewController.swift
//  Diary
//
//  Created by choi hyunjin on 2022/02/24.
//

import UIKit

protocol WriteDiaryViewDelegate: AnyObject{
  func didSelectRegister(diary: Diary)
}

class WriteDiaryViewController: UIViewController {
  @IBOutlet weak var titleTextField: UITextField!
  @IBOutlet weak var contentsTextView: UITextView!
  @IBOutlet weak var dateTextField: UITextField!
  @IBOutlet weak var confirmButton: UIBarButtonItem!
  
  private let datePicker = UIDatePicker()
  private var diaryDate : Date?
  weak var delegate: WriteDiaryViewDelegate?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.configureDatePicker()
    self.configureContentsTextView()
    self.confirmButton.isEnabled = false
    self.configureInputField()
  }
  
  @IBAction func tapConfirmButton(_ sender: Any) {
    guard let title = self.titleTextField.text else { return }
    guard let contents = self.contentsTextView.text else { return }
    guard let date = self.diaryDate else { return }
    
    let diary = Diary(title: title, contents: contents, date: date, isStar: false)
    self.delegate?.didSelectRegister(diary: diary)
    self.navigationController?.popViewController(animated: true)
  }
  
  private func configureContentsTextView(){
    let borderColor = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1.0)
    self.contentsTextView.layer.borderColor = borderColor.cgColor
    self.contentsTextView.layer.borderWidth = 0.5
    self.contentsTextView.layer.cornerRadius = 5
  }
  
  private func configureDatePicker(){
    self.datePicker.datePickerMode = .date
    self.datePicker.locale = Locale(identifier: "ko_KR")
    self.datePicker.preferredDatePickerStyle = .wheels
    self.datePicker.addTarget(self, action: #selector(datePickerValueDidChange(_ :)), for: .valueChanged)
    self.dateTextField.inputView = self.datePicker
  }
  
  private func configureInputField(){
    self.contentsTextView.delegate = self
    self.titleTextField.addTarget(self, action: #selector(titleTextFieldDidChange(_:)), for: .editingChanged)
    self.dateTextField.addTarget(self, action: #selector(dateTextFieldDidChange(_:)), for: .editingChanged)
  }
  
  @objc private func titleTextFieldDidChange(_ textField: UITextField){
    self.validateInputField()
  }
  
  @objc private func dateTextFieldDidChange(_ textField: UITextField){
    debugPrint("dateTextFieldDidChange")
    self.validateInputField()
  }
  
  @objc private func datePickerValueDidChange(_ datePicker: UIDatePicker){
    let formmater = DateFormatter()
    formmater.dateFormat = "yyyy년 MM월 dd일(EEEEE)"
    formmater.locale = Locale(identifier: "ko_KR")
    self.diaryDate = datePicker.date
    self.dateTextField.text = formmater.string(from: datePicker.date)
    self.dateTextField.sendActions(for: .editingChanged)
  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    self.view.endEditing(true)
  }
  
  private func validateInputField(){
    self.confirmButton.isEnabled = !(self.titleTextField.text?.isEmpty ?? true)
    && !(self.dateTextField.text?.isEmpty ?? true) && !self.contentsTextView.text.isEmpty
  }
}

extension WriteDiaryViewController: UITextViewDelegate{
  func textViewDidChange(_ textView: UITextView) {
    self.validateInputField()
  }
}
