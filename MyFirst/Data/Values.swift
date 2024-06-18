//
//  Helper.swift
//  MyFirst
//
//  Created by Derrick on 26/02/23.
//

import Network
import Foundation

var isRealDevice: Bool {
    return !(String(TARGET_OS_SIMULATOR)).signal
}

// Return IP address of WiFi interface (en0) as a String, or `nil`
var wifiAddress: String {
    var address : String

    // Get list of all interfaces on the local machine:
    var ifaddr : UnsafeMutablePointer<ifaddrs>? = nil
    if getifaddrs(&ifaddr) == 0 {

        // For each interface ...
        let ptr = ifaddr
        
        address = (ptr?.debugDescription ?? "").ipV4Addr?.debugDescription ?? ""
        
        return address
      } else {
        return ""
    }
}
