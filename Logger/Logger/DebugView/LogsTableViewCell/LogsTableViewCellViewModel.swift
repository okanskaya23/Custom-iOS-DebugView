//
//  LogsTableViewCellViewModel.swift
//  Logger
//
//  Created by Okan Sarp Kaya on 30.12.2022.
//

import Foundation
final class LogViewModel {
    private let model: LogModel
    
    init(model: LogEntity) {
        self.model = LogModel(name: model.logMessage, type: model.type)
    }
    
    private var emoji: String {
        switch model.type {
            case LogType.Warning.rawValue:
                    return "⚠️"
            case LogType.Error.rawValue:
                    return "❌"
            case LogType.Location.rawValue:
                    return "🗺"
            case LogType.Device.rawValue:
                    return "📱"
            case LogType.BlindSpot.rawValue:
                return "👁‍🗨"
            default:
                return "❓"
        }
    }
    
    var title: String? {
        guard let name = model.name else { return nil }
        return "\(emoji) \(name)"
    }
}
