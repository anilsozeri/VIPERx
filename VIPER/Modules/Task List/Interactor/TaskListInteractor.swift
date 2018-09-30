//
//  TaskListInteractor.swift
//  VIPER
//
//  Created by Anıl Sözeri on 28.09.2018.
//  Copyright © 2018 Anıl Sözeri. All rights reserved.
//

import Foundation
import RxSwift

final class TaskListInteractor: BaseInteractor, TaskListUseCase {
  private let service: VIPERAPIServiceType
  
  weak var output: TaskListInteractorOutput!
  
  init(service: VIPERAPIServiceType = VIPERAPIService()) {
    self.service = service
  }
  
  func fetchTasks() {
    service.fetchTaskList()
      .observeOn(MainScheduler.instance)
      .subscribe(onSuccess: { [weak self] tasks in
        guard let `self` = self, let tasks = tasks else { return }
        
        self.output.tasksFetched(with: tasks)
      }) { [weak self] error in
        guard let `self` = self else { return }
        
        self.output.tasksFetchFailed()
    }.disposed(by: disposeBag)
  }
}
