//
//  IndicatableViewExtension.swift
//  VIPER
//
//  Created by Anıl Sözeri on 24.09.2018.
//  Copyright © 2018 Anıl Sözeri. All rights reserved.
//

import UIKit

extension IndicatableView where Self: UIViewController {
  func showActivityIndicator() {
    ActivityIndicator.shared.showActivityIndicator(in: view)
  }
  
  func hideActivityIndicator() {
    ActivityIndicator.shared.hideActivityIndicator()
  }
}
