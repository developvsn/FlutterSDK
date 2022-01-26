//
//  GetIdenfyAuthTokenUseCase.swift
//  idenfy-sample-ios
//
//  Created by Viktor Vostrikov on 2020-06-22.
//  Copyright © 2020 Viktor Vostrikov. All rights reserved.
//

import Foundation

class GetIdenfyAuthTokenUseCase {
    let apiHelper: APIHelper

    init(apiHelper: APIHelper) {
        self.apiHelper = apiHelper
    }

    func execute(authTokenBody: AuthTokenBody, appLanguage: AppLanguage, success _success: @escaping (AuthToken) -> Void,
                 failure _failure: @escaping (ErrorResponse) -> Void) {
        let success: (AuthToken) -> Void = { AuthToken in
            DispatchQueue.main.async {
                _success(AuthToken)
            }
        }
        let failure: (ErrorResponse) -> Void = { error in
            DispatchQueue.main.async {
                _failure(error)
            }
        }
        let apiKey = Consts.apiKey
        let apiSecret = Consts.apiSecret

        let loginString = "\(apiKey):\(apiSecret)"

        guard let loginData = loginString.data(using: String.Encoding.utf8) else {
            return
        }
        let base64LoginString = loginData.base64EncodedString()

        let urlString = Consts.baseURL

        let url = URL(string: urlString)!
        let uploadingRequest = url.appendingPathComponent("api/v2/token")
        var request = apiHelper.getRequestBody(_type: "POST", _url: uploadingRequest)

        request.setValue("Basic \(base64LoginString)", forHTTPHeaderField: "Authorization")
        var json: [String: Any] = [:]

        json.updateValue(authTokenBody.clientId, forKey: "clientId")
        json.updateValue(authTokenBody.country, forKey: "country")
        json.updateValue(authTokenBody.documents, forKey: "documents")

        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        request.httpBody = jsonData

        let session = URLSession.shared

        let task = session.dataTask(with: request, completionHandler: { data, response, error in

            guard let data = data else {
                let idefyError = ErrorResponse(message:
                    error.debugDescription)

                failure(idefyError)
                return
            }

            if let httpResponse = response as? HTTPURLResponse {
                if httpResponse.statusCode >= 200, httpResponse.statusCode < 300 {
                    do {
                        let response = try JSONDecoder().decode(Throwable<AuthToken>.self, from: data)
                        success(response.value!)
                    } catch {
                        let idefyError = ErrorResponse(message:
                            "IDENFY_SERVER_ERROR_MESSAGE".localized(appLanguage.languageEnum))

                        failure(idefyError)
                    }
                } else if httpResponse.statusCode >= 400, httpResponse.statusCode < 500 {
                    do {
                        let idenfyErrror = try JSONDecoder().decode(Throwable<ErrorResponse>.self, from: data)

                        failure(idenfyErrror.value!)
                    } catch {
                        let idefyError = ErrorResponse(message:
                            "IDENFY_SERVER_ERROR_MESSAGE".localized(appLanguage.languageEnum))
                        failure(idefyError)
                    }
                } else {
                    let idefyError = ErrorResponse(message: "IDENFY_SERVER_ERROR_MESSAGE".localized(appLanguage.languageEnum))
                    failure(idefyError)
                }
            }
           })
        task.resume()
    }
}
