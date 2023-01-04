//
//  PointrLogger.swift
//  Debug
//
//  Created by Okan Sarp Kaya on 28.12.2022.
//

import Foundation
public class PointrLogger {
    
    public init(){}
    
    public static func logCurrentPosition(x: Double, y: Double, z: Double ){
        let logMessage = "Position: X: \(x) Y: \(y) Z: \(z)"
        NSLog(logMessage)
        LogDataInterface.addLog(logModel: LogModel(name: logMessage, type: LogType.Location.rawValue))
    }
    
    public static func logConnectedDevice(deviceName: String, connectionStrength: Double, DeviceId: String ){
        let logMessage = "Device Name: \(deviceName) \n Connection Strength: \(connectionStrength) \n DeviceId: \(DeviceId)"
        NSLog(logMessage)
        LogDataInterface.addLog(logModel: LogModel(name: logMessage, type: LogType.Device.rawValue))
    }
    
    public static func logBlindSpotDevice(lastKnownX: Double, lastKnownY: Double, lastKnownZ: Double , lastConnectedDeviceId: String){
        let logMessage = "Blind Spot Last Known X: \(lastKnownX) Last Known Y: \(lastKnownY) Last Known Z: \(lastKnownZ) \n \n Last Connected Device Id: \(lastConnectedDeviceId)"
        NSLog(logMessage)
        LogDataInterface.addLog(logModel: LogModel(name: logMessage, type: LogType.BlindSpot.rawValue))
    }
    
    public static func logMessage(logMessage: String, type: LogType){
        let logMessage = "Log Message: \(logMessage)"
        NSLog(logMessage)
        LogDataInterface.addLog(logModel: LogModel(name: logMessage, type: type.rawValue))
    }


    
}
