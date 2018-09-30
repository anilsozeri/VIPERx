//
//  TaskListContract.swift
//  VIPER
//
//  Created by Anıl Sözeri on 29.09.2018.
//  Copyright © 2018 Anıl Sözeri. All rights reserved.
//

import UIKit

protocol TaskListView: IndicatableView {
  func showTasks(with tasks: [Task])
  func showEmptyContentView()
}

protocol TaskListPresentation: class {
  weak var view: TaskListView? { get set }
  var interactor: TaskListUseCase! { get set }
  var router: TaskListWireframe! { get set }
  
  func viewDidLoad()
  func didSelectTask(with task: Task)
}

protocol TaskListUseCase: class {
  weak var output: TaskListInteractorOutput! { get set }
  
  func fetchTasks()
}

protocol TaskListInteractorOutput: class {
  func tasksFetched(with tasks: [Task])
  func tasksFetchFailed()
}

protocol TaskListWireframe: class {
  weak var viewController: UIViewController? { get set }
  
  func presentDetails(for task: Task)
}
