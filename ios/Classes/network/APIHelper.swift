//
//  APIHelper.swift
//  idenfy-sample-ios
//
//  Created by Viktor Vostrikov on 2020-06-22.
//  Copyright © 2020 Viktor Vostrikov. All rights reserved.
//

import Foundation
class APIHelper {
    init() {}

    func getRequestBody(_type: String, _url: URL) -> URLRequest {
        var request = URLRequest(url: _url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.timeoutInterval = 300

        request.httpMethod = _type
        return request
    }

    func getMultipartRequestBody(_type: String, _url: URL, boundary: String) -> URLRequest {
        var request = URLRequest(url: _url)
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        request.timeoutInterval = 300

        request.httpMethod = _type
        return request
    }
}
