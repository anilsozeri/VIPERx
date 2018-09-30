//
//  TaskListTableViewCell.swift
//  VIPER
//
//  Created by Anıl Sözeri on 30.09.2018.
//  Copyright © 2018 Anıl Sözeri. All rights reserved.
//

import UIKit

final class TaskListTableViewCell: UITableViewCell {
  @IBOutlet weak var titleLabel: UILabel!
  
  func configure(with task: Task) {
    titleLabel.text = task.title
  }
}
