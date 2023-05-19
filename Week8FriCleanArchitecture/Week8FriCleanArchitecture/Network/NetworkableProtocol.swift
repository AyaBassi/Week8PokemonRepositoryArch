//
//  NetworkableProtocol.swift
//  Week8FriCleanArchitecture
//
//  Created by Payam Karbassi on 19/05/2023.
//

import Foundation
protocol NetworkableProtocol{
    func getData(url:URL) async throws -> Data
}
