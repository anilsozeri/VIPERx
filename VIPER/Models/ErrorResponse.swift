//
//  ErrorResponse.swift
//  VIPER
//
//  Created by Anıl Sözeri on 28.09.2018.
//  Copyright © 2018 Anıl Sözeri. All rights reserved.
//

import Foundation

final class ErrorResponse: Codable {
  let message: String
  
  init(message: String) {
    self.message = message
  }
}
