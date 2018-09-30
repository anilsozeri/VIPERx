//
//  BaseViewController.swift
//  VIPER
//
//  Created by Anıl Sözeri on 28.09.2018.
//  Copyright © 2018 Anıl Sözeri. All rights reserved.
//

import UIKit
import SnapKit
import RxSwift

class BaseViewController: UIViewController {
  var activityIndicator: UIActivityIndicatorView!
  
  let disposeBag = DisposeBag()
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
}
