//
//  TaskDetailViewController.swift
//  VIPER
//
//  Created by Anıl Sözeri on 30.09.2018.
//  Copyright © 2018 Anıl Sözeri. All rights reserved.
//

import UIKit

final class TaskDetailViewController: BaseViewController {
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var contentLabel: UILabel!
  
  var presenter: TaskDetailPresentation!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    presenter.viewDidLoad()
    
    setupView()
  }
  
  func setupView() {
    navigationItem.title = Localization.TaskDetail.navigationTitle
  }
}

extension TaskDetailViewController: TaskDetailView {
  func showTaskDetail(with task: Task) {
    titleLabel.text = task.title
    contentLabel.text = task.content
  }
}
