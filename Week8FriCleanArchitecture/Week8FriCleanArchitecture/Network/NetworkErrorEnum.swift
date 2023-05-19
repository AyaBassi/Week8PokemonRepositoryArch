//
//  NetworkErrorEnum.swift
//  Week8FriCleanArchitecture
//
//  Created by Payam Karbassi on 19/05/2023.
//

import Foundation
enum NetworkErrorEnum : Error{
    case dataNotFoundError
    case invalidUrl
    case parsingError
}

extension  NetworkErrorEnum  : LocalizedError, Equatable {
    var errorDescription: String?{
        switch self {
        case .invalidUrl:
            return NSLocalizedString("invalidUrl", comment: "invalidUrl")
        case .parsingError:
            return NSLocalizedString("parsingError", comment: "parsingError")
        case .dataNotFoundError:
            return NSLocalizedString("dataNotFoundError", comment: "dataNotFoundError")
        }
    }
}
