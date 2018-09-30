//
//  TaskListRouter.swift
//  VIPER
//
//  Created by Anıl Sözeri on 28.09.2018.
//  Copyright © 2018 Anıl Sözeri. All rights reserved.
//

import UIKit

final class TaskListRouter: TaskListWireframe {
  var viewController: UIViewController?
  
  func presentDetails(for task: Task) {
    let taskDetailViewController = TaskDetailRouter.assembleModule(with: task)
    
    viewController?.navigationController?.pushViewController(taskDetailViewController, animated: true)
  }
}
