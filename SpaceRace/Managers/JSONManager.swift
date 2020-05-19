//
//  JSONManager.swift
//  SpaceRace
//
//  Created by Roberto Scarpati on 26/03/2020.
//  Copyright © 2020 fernando rosa. All rights reserved.
//

import Foundation

///The class which handles the json file.

struct PlayerJSONStruct: Codable {
    var verticalPosition = Double()
    var verticalSpeed = Double()
    var verticalAcceleration = Double()
}

class JsonManager{
    
    static let shared = JsonManager()
    
    private init(){
        
    }
    
    ///Call this function in order to load the bool value related to firstLogin field in firstLogin.json
   func load() -> [PlayerJSONStruct] {
    
    var temp = [PlayerJSONStruct]()
        do {
            let fileURL = try FileManager.default
                .url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
                .appendingPathComponent("MLData.json")

            let data = try Data(contentsOf: fileURL)
            temp = try JSONDecoder().decode([PlayerJSONStruct].self, from: data)
        } catch {
            print(error)
        }
    
    return temp
    }

     ///Call this function in order to update the value  related to firstLogin field in firstLogin.json
    func save(verticalPosition: Double, verticalSpeed: Double, verticalAcceleration: Double) {
        let t = PlayerJSONStruct(verticalPosition: verticalPosition, verticalSpeed: verticalSpeed, verticalAcceleration: verticalAcceleration)
        
        var temp = load()
        temp.append(t)
        do {
            let fileURL = try FileManager.default
                .url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
                .appendingPathComponent("MLData.json")

            try JSONEncoder().encode(temp)
                .write(to: fileURL)
        } catch {
            print(error)
        }
    }
}
