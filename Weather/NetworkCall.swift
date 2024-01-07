////
////  NetworkCall.swift
////  Weather
////
////  Created by Sergey Zakurakin on 07/01/2024.
////
//
//import Foundation
//
//
//
//
//
//
//struct NetworkCall {
//    
//    func getLocation() async throws -> LocationManager {
//        let urlString = "https://geocode.maps.co/search?q=Berlin&api_key=658eceba168c9076314183bvmfc3f66"
//        guard let url = URL(string: urlString) else {
//            throw NetworkErrors.invalidURL
//        }
//        
//        
//        let (data, response) = try await URLSession.shared.data(from: url)
//        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
//            throw NetworkErrors.invalidResponse
//        }
//        
//        do {
//            let decoder = JSONDecoder()
//            decoder.keyDecodingStrategy = .convertFromSnakeCase
//            return try decoder.decode(LocationManager.self, from: data)
//        } catch {
//            throw NetworkErrors.invalidData
//        }
//        
//    }
//    
//    
//    
//}
//
//
//enum NetworkErrors: Error {
//    case invalidURL
//    case invalidResponse
//    case invalidData
//    
//}
//
//
//
//
//
//
//
//
//
//
//
//
//
//
////var cityName: String
////var url: String
////var apiKey: String
//
