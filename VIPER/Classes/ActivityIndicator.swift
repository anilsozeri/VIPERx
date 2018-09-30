//
//  ActivityIndicator.swift
//  VIPER
//
//  Created by Anıl Sözeri on 30.09.2018.
//  Copyright © 2018 Anıl Sözeri. All rights reserved.
//

import UIKit

final class ActivityIndicator {
  static let shared = ActivityIndicator()
  
  var activityIndicator: UIActivityIndicatorView!
  
  func showActivityIndicator(in view: UIView) {
    if activityIndicator == nil {
      activityIndicator = UIActivityIndicatorView(style: .whiteLarge)
      activityIndicator.hidesWhenStopped = true
      activityIndicator.color = .gray
      
      view.addSubview(activityIndicator)
      
      activityIndicator.snp.makeConstraints { make in
        make.center.equalToSuperview()
      }
    }
    
    activityIndicator.startAnimating()
  }
  
  func hideActivityIndicator() {
    activityIndicator.stopAnimating()
  }
}
