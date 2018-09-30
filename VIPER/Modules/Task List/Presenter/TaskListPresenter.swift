//
//  TaskListPresenter.swift
//  VIPER
//
//  Created by Anıl Sözeri on 28.09.2018.
//  Copyright © 2018 Anıl Sözeri. All rights reserved.
//

import Foundation

final class TaskListPresenter: TaskListPresentation {
  weak var view: TaskListView?
  var interactor: TaskListUseCase!
  var router: TaskListWireframe!
  
  var tasks: [Task] = [] {
    didSet {
      if tasks.count > 0 {
        view?.showTasks(with: tasks)
      } else {
        view?.showEmptyContentView()
      }
    }
  }
  
  func viewDidLoad() {
    interactor.fetchTasks()
    view?.showActivityIndicator()
  }
  
  func didSelectTask(with task: Task) {
    router.presentDetails(for: task)
  }
}

extension TaskListPresenter: TaskListInteractorOutput {
  func tasksFetched(with tasks: [Task]) {
    self.tasks = tasks
    view?.hideActivityIndicator()
  }
  
  func tasksFetchFailed() {
    view?.showEmptyContentView()
    view?.hideActivityIndicator()
  }
}
