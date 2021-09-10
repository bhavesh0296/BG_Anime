//
//  APIService.swift
//  iTune Music
//
//  Created by bhavesh on 07/07/21.
//  Copyright © 2021 Bhavesh. All rights reserved.
//

import Foundation

class APIService {

    //MARK:- Singleton Instance
    static let shared = APIService()

    //MARK:- private initializer
    private init() { }

    
    func getRequest<T: Decodable>(_ endPoint: APIEndPoints, completion: @escaping (Result<T, Error>) -> Void) {
        guard let sourceUrl = endPoint.sourceUrl else {
            completion(.failure(APIError.creatingSourceUrlFail))
            return
        }
        URLSession.shared.dataTask(with: sourceUrl) { (data, urlResponse, error) in

            if let error = error {
                completion(.failure(error))
                return
            }

            if let data = data {
                do {
                    let jsonData = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(jsonData))

                } catch {
                    print(String(describing: error))
                    completion(.failure(error))
                }
            }
        }.resume()
    }

    func postRequest<T: Decodable>(_ endPoint: APIEndPoints, parameters: [String: Any], completion: @escaping (Result<T, Error>) -> Void) {
        guard let sourceUrl = endPoint.sourceUrl else {
            completion(.failure(APIError.creatingSourceUrlFail))
            return
        }
        var request = URLRequest(url: sourceUrl)
        request.httpMethod = "POST"

        let formDataString = self.getFormDataString(parameters: parameters)
        request.httpBody = formDataString.data(using: .utf8)

        URLSession.shared.dataTask(with: request) { (data, urlResponse, error) in

            if let error = error {
                completion(.failure(error))
                return
            }

            if let data = data {
                do {
                    let jsonData = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(jsonData))

                } catch {
                    print(String(describing: error))
                    completion(.failure(error))
                }
            }
        }.resume()

    }


    func getFormDataString(parameters:[String:Any]) -> String {
        var data = [String]()
        for(key, value) in parameters {
            data.append(key + "=\(value)")
        }
        return data.map { String($0) }.joined(separator: "&")
    }

}
