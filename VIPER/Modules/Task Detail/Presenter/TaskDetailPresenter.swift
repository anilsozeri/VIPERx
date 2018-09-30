//
//  TaskDetailPresenter.swift
//  VIPER
//
//  Created by Anıl Sözeri on 30.09.2018.
//  Copyright © 2018 Anıl Sözeri. All rights reserved.
//

import Foundation

final class TaskDetailPresenter: TaskDetailPresentation {
  var view: TaskDetailView?
  var task: Task!
  
  func viewDidLoad() {
    view?.showTaskDetail(with: task)
  }
}
