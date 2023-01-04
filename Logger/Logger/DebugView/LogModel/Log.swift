//
//  Log.swift
//  Debug
//
//  Created by Okan Sarp Kaya on 26.12.2022.
//

import Foundation

public struct LogModel: Hashable, Encodable, Decodable {
    var id = UUID()
    let name:String?
    let type: LogType.RawValue?
}

public enum LogType: Int16, Decodable, Encodable{
    case Warning = 0
    case Error = 1
    case Location = 2
    case Device = 3
    case BlindSpot = 4
}
