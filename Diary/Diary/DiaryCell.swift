//
//  DiaryCell.swift
//  Diary
//
//  Created by choi hyunjin on 2022/02/15.
//

import UIKit

class DiaryCell: UICollectionViewCell {
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var dateLabel: UILabel!
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    self.contentView.layer.cornerRadius = 3.0
    self.contentView.layer.borderWidth = 1.0
    self.contentView.layer.borderColor = UIColor.blue.cgColor
  }
  
}
