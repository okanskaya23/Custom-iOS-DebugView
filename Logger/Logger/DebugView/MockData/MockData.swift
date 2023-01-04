//
//  MockData.swift
//  Debug
//
//  Created by Okan Sarp Kaya on 27.12.2022.
//

import Foundation
public class MockLogData{
    
    public init(){}

    func getLogList()  -> [LogModel] {
        return [LogModel(name: "Log1", type: LogType.Error.rawValue)]

    }
    
    public static func generateMockLogs(){
        PointrLogger.logCurrentPosition(x: 12.0, y: 12.0, z: 12.0)
        PointrLogger.logConnectedDevice(deviceName: "Wifi-3", connectionStrength: 67.0, DeviceId: UUID().uuidString)
        PointrLogger.logBlindSpotDevice(lastKnownX: 12.0, lastKnownY: 12.0, lastKnownZ: 12.0, lastConnectedDeviceId: UUID().uuidString)
        PointrLogger.logMessage(logMessage: "this is error", type: .Error)
        PointrLogger.logMessage(logMessage: "this is warning", type: .Warning)

    }
}
