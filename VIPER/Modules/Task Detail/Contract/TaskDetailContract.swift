//
//  TaskDetailContract.swift
//  VIPER
//
//  Created by Anıl Sözeri on 30.09.2018.
//  Copyright © 2018 Anıl Sözeri. All rights reserved.
//

import UIKit

protocol TaskDetailView: class {
  var presenter: TaskDetailPresentation! { get set }
  
  func showTaskDetail(with task: Task)
}

protocol TaskDetailPresentation: class {
  weak var view: TaskDetailView? { get set }
  
  func viewDidLoad()
}

protocol TaskDetailWireframe: class {
  static func assembleModule(with task: Task) -> UIViewController
}
