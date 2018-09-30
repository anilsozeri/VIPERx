//
//  Storyboard.swift
//  VIPER
//
//  Created by Anıl Sözeri on 30.09.2018.
//  Copyright © 2018 Anıl Sözeri. All rights reserved.
//

import UIKit

enum Storyboard: String {
  case taskList = "TaskList"
  case taskDetail = "TaskDetail"
  
  func viewController<T: UIViewController>(with viewControllerClass: T.Type) -> T {
    let storyboardIdentifier = (viewControllerClass as UIViewController.Type).storyboardIdentifier
    
    guard let viewController = UIStoryboard(name: self.rawValue, bundle: nil).instantiateViewController(withIdentifier: storyboardIdentifier) as? T else {
      fatalError("ViewController with identifier \(storyboardIdentifier), not found in \(self.rawValue) Storyboard")
    }
    
    return viewController
  }
}
