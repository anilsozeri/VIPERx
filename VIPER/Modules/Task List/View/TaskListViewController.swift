//
//  TaskListViewController.swift
//  VIPER
//
//  Created by Anıl Sözeri on 28.09.2018.
//  Copyright © 2018 Anıl Sözeri. All rights reserved.
//

import UIKit

final class TaskListViewController: UIViewController {
  @IBOutlet weak var taskListTableView: UITableView!
  
  let presenter = TaskListPresenter()
  let interactor = TaskListInteractor()
  let router = TaskListRouter()
  
  var tasks: [Task] = [] {
    didSet {
      taskListTableView.reloadData()
    }
  }
  
  private let taskListTableViewCellIdentifier = "TaskListTableViewCell"
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    presenter.view = self
    presenter.interactor = interactor
    presenter.router = router
    
    interactor.output = presenter
    
    router.viewController = self
    
    presenter.viewDidLoad()
    
    setupView()
  }
  
  func setupView() {
    navigationItem.title = Localization.TaskList.navigationTitle
  }
}

extension TaskListViewController: TaskListView {
  func showTasks(with tasks: [Task]) {
    self.tasks = tasks
  }
  
  func showEmptyContentView() {}
}

extension TaskListViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: taskListTableViewCellIdentifier, for: indexPath) as! TaskListTableViewCell
    
    cell.configure(with: tasks[indexPath.item])
    
    return cell
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return tasks.count
  }
}

extension TaskListViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    presenter.didSelectTask(with: tasks[indexPath.item])
  }
}
