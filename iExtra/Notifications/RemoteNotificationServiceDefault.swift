//
//  RemoteNotificationServiceDefault.swift
//  iExtra
//
//  Created by Daniel Saidi on 2015-10-24.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

import UserNotifications

open class RemoteNotificationServiceDefault: NSObject, RemoteNotificationService {
    
    open func alert(notification: [AnyHashable: Any]) {
        let app = UIApplication.shared
        guard let aps = notification["aps"] as? [AnyHashable: Any] else { return }
        let text = aps["alert"] as? String
        if app.applicationState == .active && text != nil {
            let alert: UIAlertController = UIAlertController(title: nil, message: text, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            app.keyWindow?.rootViewController?.present(alert, animated: true, completion: nil)
        }
    }
    
    open func getDeviceToken(from deviceTokenData: Data) -> String {
        let token = deviceTokenData as NSData
        let tokenChars = token.bytes.bindMemory(to: CChar.self, capacity: deviceTokenData.count)
        var tokenString = ""
        for i in 0..<deviceTokenData.count {
            tokenString += String(format: "%02.2hhx", arguments: [tokenChars[i]])
        }
        return tokenString
    }
    
    open func handle(notification: [AnyHashable: Any]) {
        alert(notification: notification)
    }
    
    open func registerForRemoteNotifications() {
        fatalError("registerForRemoteNotifications must be implemented in your app")
    }
}
