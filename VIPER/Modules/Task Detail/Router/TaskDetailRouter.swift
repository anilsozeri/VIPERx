//
//  TaskDetailRouter.swift
//  VIPER
//
//  Created by Anıl Sözeri on 30.09.2018.
//  Copyright © 2018 Anıl Sözeri. All rights reserved.
//

import UIKit

final class TaskDetailRouter: TaskDetailWireframe {
  static func assembleModule(with task: Task) -> UIViewController {
    let view = Storyboard.taskDetail.viewController(with: TaskDetailViewController.self)
    let presenter = TaskDetailPresenter()
    
    view.presenter = presenter
    
    presenter.view = view
    presenter.task = task
    
    return view
  }
}
