//
//  Place.swift
//  Cheers
//
//  Created by Will on 3/7/18.
//  Copyright © 2018 University of San Diego. All rights reserved.
//

import Foundation

let DocumentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
let ArchiveURL = DocumentsDirectory.appendingPathComponent("places").appendingPathExtension("plist")

extension String {
    var lines: [String] {
        var result: [String] = []
        enumerateLines { line, _ in result.append(line) }
        return result
    }
}

public struct Place: Equatable, Codable{
    var record: DatabaseRecord
    var favorited: Bool
    
    public static func ==(lhs: Place, rhs: Place) -> Bool {
        return lhs.record.id == rhs.record.id
    }

    init(record: DatabaseRecord, favorited: Bool){
        self.record = record
        self.favorited = favorited
    }
    
    static func saveToFile(favoritedPlace: Place) {
        let encoder = PropertyListEncoder()
        let encodedPlaces = try? encoder.encode(favoritedPlace)
        try? encodedPlaces?.write(to: ArchiveURL, options: .noFileProtection)
        print("\n saving to file: \n \(favoritedPlace) \n")
    }
    
    static func loadFromFile() -> [Place]?  {
        guard let decodedPlaces = try? Data(contentsOf: ArchiveURL) else {return nil}
        let decoder = PropertyListDecoder()
       
        return try? decoder.decode(Array<Place>.self, from: decodedPlaces)
    }
    
}



