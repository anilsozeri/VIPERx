//
//  Task.swift
//  VIPER
//
//  Created by Anıl Sözeri on 28.09.2018.
//  Copyright © 2018 Anıl Sözeri. All rights reserved.
//

import Foundation

final class Task: Codable {
  let title: String
  let content: String
  
  init(title: String, content: String) {
    self.title = title
    self.content = content
  }
}
