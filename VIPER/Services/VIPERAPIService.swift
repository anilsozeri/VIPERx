//
//  VIPERAPIService.swift
//  VIPER
//
//  Created by Anıl Sözeri on 28.09.2018.
//  Copyright © 2018 Anıl Sözeri. All rights reserved.
//

import Foundation
import RxSwift
import RxAlamofire
import Alamofire

protocol VIPERAPIServiceType {
  func getTaskList() -> Single<[Task]?>
}

enum Endpoint: String {
  case taskList
  
  var url: URL {
    return URL(string: Config.baseUrl + self.rawValue)!
  }
}

final class VIPERAPIService: VIPERAPIServiceType {
  private let manager = HTTPManager.shared
  private var headers: [String: String] = ["Content-Type": "application/json"]
  private let encoding = JSONEncoding.default
  
  private let SUCCESS = 200
  
  private let disposeBag = DisposeBag()
  
  func getTaskList() -> Single<[Task]?> {
    return request(methodType: .get, url: Endpoint.taskList.url)
  }
  
  private func request<T: Codable>(methodType: HTTPMethod, url: URL, parameters: [String: AnyObject]? = nil) -> Single<T?> {
    if !Reachability.isConnectedToNetwork() {
      return Single.error(APIError(with: .internetConnection, message: "Please check your internet connection."))
    }
    
    return manager.rx.responseString(methodType, url, parameters: parameters, encoding: encoding, headers: headers)
      .observeOn(ConcurrentDispatchQueueScheduler(qos: DispatchQoS(qosClass: DispatchQoS.QoSClass.background, relativePriority: 1)))
      .asSingle()
      .catchError { error -> Single<(HTTPURLResponse, String)> in
        return Single.error(APIError(with: .unknown, message: error.localizedDescription))
      }
      .flatMap { json -> Single<T?> in
        let statusCode = json.0.statusCode
        let jsonString = json.1
        
        guard let data = jsonString.data(using: .utf8) else { return Single.just(nil) }
        
        if statusCode == self.SUCCESS {
          if let response = try? JSONDecoder().decode(T.self, from: data) {
            return Single.just(response)
          } else {
            let errorResponse = try JSONDecoder().decode(ErrorResponse.self, from: data)
            let errorType = APIErrorType.allValues.filter { statusCode == $0.rawValue }.first ?? .mapping
            let error = APIError(with: errorType, message: errorResponse.message)
            
            return Single.error(error)
          }
        }
        
        let errorResponse = try JSONDecoder().decode(ErrorResponse.self, from: data)
        let errorType = APIErrorType.allValues.filter { statusCode == $0.rawValue }.first ?? .unknown
        let error = APIError(with: errorType, message: errorResponse.message)
        
        return Single.error(error)
    }
  }
  
  final class HTTPManager: Alamofire.SessionManager {
    static let shared: HTTPManager = {
      let configuration = URLSessionConfiguration.default
      configuration.timeoutIntervalForRequest = Constants.timeout
      configuration.timeoutIntervalForResource = Constants.timeout
      
      let manager = HTTPManager(configuration: configuration)
      
      return manager
    }()
  }
}
