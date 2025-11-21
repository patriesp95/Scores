//
//  JSONLoader.swift
//  Scores
//
//  Created by Patricia M Espert on 13/11/25.
//
import Foundation

protocol JSONLoader {
    var url: URL { get }
    var docURL: URL { get }
}

extension JSONLoader {
    func load<JSON>(type: JSON.Type) throws -> JSON where JSON: Decodable {
        var fileURL = url
        if FileManager.default.fileExists(atPath: docURL.path()) {
            fileURL = docURL
        }
        
        let data = try Data(contentsOf: fileURL)
        return try JSONDecoder().decode(type, from: data)
    }
    
    func save<JSON>(data: [JSON]) throws where JSON: Encodable {
        let data = try JSONEncoder().encode(data)
        try data.write(to: docURL, options: .atomic) // avoids data race
    }
}
