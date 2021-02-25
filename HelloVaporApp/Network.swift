//
//  Network.swift
//  HelloVaporApp
//
//  Created by Ramill Ibragimov on 25.02.2021.
//

import Foundation

class Network {
    
    func postRequest(name: String) {
        let semaphore = DispatchSemaphore (value: 0)
        
        let parameters = "{\n    \"name\": \"\(name)\"\n}"
        let postData = parameters.data(using: .utf8)
        
        var request = URLRequest(url: URL(string: "http://127.0.0.1:8080/user")!,timeoutInterval: Double.infinity)
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        request.httpMethod = "POST"
        request.httpBody = postData
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
            semaphore.signal()
            return
          }
          print(String(data: data, encoding: .utf8)!)
          semaphore.signal()
        }

        task.resume()
        semaphore.wait()
    }
}
