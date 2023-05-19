//
//  NetworkManager.swift
//  Week8FriCleanArchitecture
//
//  Created by Payam Karbassi on 19/05/2023.
//

import Foundation
class NetworkManager : NetworkableProtocol{
    
    
    func getData(url: URL) async throws -> Data {
        do{
            let (data, response) = try await URLSession.shared.data(from: url)
            return data
        }catch is CFErrorDomain {
          print("error")
            
            throw NetworkErrorEnum.invalidUrl
        }
        catch let error {
            print(error)
            throw NetworkErrorEnum.dataNotFoundError
        }
        
    }
    
    
}
