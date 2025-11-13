//
//  JSONLoader.swift
//  Scores
//
//  Created by Patricia M Espert on 13/11/25.
//
import Foundation

protocol JSONLoader {
    var url: URL { get }
}

extension JSONLoader {
    func load<JSON>(type: JSON.Type) throws -> JSON where JSON: Decodable {
        let data = try Data(contentsOf: url)
        return try JSONDecoder().decode(JSON.self, from: data)
    }
    
    func save<JSON>(data: [JSON]) throws where JSON: Encodable {
        let data = try JSONEncoder().encode(data)
        try data.write(to: url, options: .atomic) // avoids data race
    }
}
