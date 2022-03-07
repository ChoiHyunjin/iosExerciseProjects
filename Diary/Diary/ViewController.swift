//
//  ViewController.swift
//  Diary
//
//  Created by choi hyunjin on 2022/02/15.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet weak var collectionView: UICollectionView!
  
  var diaryList = [Diary]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.configureCollectionView()
  }

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let writeDiaryVC = segue.destination as? WriteDiaryViewController{
      writeDiaryVC.delegate = self
    }
  }
  
  private func configureCollectionView() {
    self.collectionView.collectionViewLayout = UICollectionViewLayout()
    self.collectionView.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    self.collectionView.delegate = self
    self.collectionView.dataSource = self
  }
  
  private func dateToString(date: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "yy년 MM월 dd일 (EEEEE)"
    formatter.locale = Locale(identifier: "ko-KR")
    return formatter.string(from: date)
  }
}

extension ViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    debugPrint("numberOfItemsInSection:", self.diaryList)
    return self.diaryList.count
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    debugPrint("cellForItemAt")
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DiaryCell", for: indexPath) as? DiaryCell else { return UICollectionViewCell() }
    let diary = self.diaryList[indexPath.row]
    cell.titleLabel.text = diary.title
    cell.dateLabel.text = self.dateToString(date: diary.date)
    return cell
  }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: (UIScreen.main.bounds.width / 2) - 20, height: 200)
  }
}

extension ViewController: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    guard let viewContoller = self.storyboard?.instantiateViewController(identifier: "DiaryDetailViewController") as? DiaryDetailViewController else { return }
    let diary = self.diaryList[indexPath.row]
//    viewContoller.diary = diary
//    viewContoller.indexPath = indexPath
    self.navigationController?.pushViewController(viewContoller, animated: true)
  }
}

extension ViewController: WriteDiaryViewDelegate {
  func didSelectRegister(diary: Diary) {
    self.diaryList.append(diary)
    self.diaryList = self.diaryList.sorted(by: {
      $0.date.compare($1.date) == .orderedDescending
    })
    debugPrint("reload")
    self.collectionView.reloadData()
  }
}
