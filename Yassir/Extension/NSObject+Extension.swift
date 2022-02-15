//
//  NSObject+Extension.swift
//  Yassir
//
//  Created by Indubala Jayachandran on 15/02/22.
//

import Foundation

extension NSObject {
    
    class func parseObject<T: Codable>(_: T.Type, data: [String: Any]) -> T? {
        do {
            let resultsData = try JSONSerialization.data(withJSONObject: data, options: .prettyPrinted)
            return try JSONDecoder().decode(T.self, from: resultsData)
        } catch {
            debugPrint("\(error) \nClass: " + String(describing: T.self))
            return nil
        }
    }
    
    class func parseList<T: Codable>(_: T.Type, data: [[String: Any]]) -> [T]? {
        do {
            let resultsData = try JSONSerialization.data(withJSONObject: data, options: .prettyPrinted)
            return try JSONDecoder().decode([T].self, from: resultsData)
        } catch {
            debugPrint("\(error) \nClass: " + String(describing: T.self))
            return nil
        }
    }
    
    class func parseJsonString<T: Codable>(_: T.Type, string: String) -> T? {
        do {
            let data = string.data(using: String.Encoding.utf8)
            let jsonData = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments)
            let resultsData = try JSONSerialization.data(withJSONObject: jsonData, options: .prettyPrinted)
            return try JSONDecoder().decode(T.self, from: resultsData)
        } catch {
            debugPrint("\(error) \nClass: " + String(describing: T.self))
            return nil
        }
    }
}
