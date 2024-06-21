//
//  Helper.swift
//  MyFirst
//
//  Created by Derrick on 26/02/23.
//

import Network
import SwiftUI
import Foundation

var screen: UIScreen = UIScreen()

var currentDevice = UIDevice.current

var sharedUrlSesh = URLSession.shared

var decoder: JSONDecoder = JSONDecoder()

var mainScreen: UIScreen = UIScreen.main

var mainDispatchQueue = DispatchQueue.main

var defaultUrlSeshConfig = URLSessionConfiguration.default

var isRealDevice: Bool = !(String(TARGET_OS_SIMULATOR)).signal

var currentNetwork = currentNetworkType.debugDescription + ": " + currentNetworkAddress

var currentNetworkType: NetworkType? {
    
    // Get list of all interfaces on the local machine:
    var ifaddr : UnsafeMutablePointer<ifaddrs>? = nil
    guard getifaddrs(&ifaddr) == 0 else { return nil }
    guard let firstAddr = ifaddr else { return nil }

        // For each interface ...
    for ifptr in sequence(first: firstAddr, next: { $0.pointee.ifa_next }) {
        let interface = ifptr.pointee
        
        // Check for IPv4 or IPv6 interface:
        let addrFamily = interface.ifa_addr.pointee.sa_family
        if [AF_INET.unsignedInt8Bit, AF_INET6.unsignedInt8Bit].contains([addrFamily])  {
            
            // Check interface name:
            let name = interface.ifa_name.string.lowerCased
            switch name {
                case "en0":
                    return .wifi
                case "en2":
                return .wired
                case "en3":
                return .wired
                case "en4":
                    return .wired
                case "pdp_ip0":
                return .cellular
                case "pdp_ip1":
                return .cellular
                case "pdp_ip2":
                return .cellular
                case "pdp_ip3":
                    return .cellular
                default:
                    return nil
            }
        }
        else {
            return nil
        }
    }
    return nil
}

// Return IP address of WiFi interface (en0) as a String, or `nil`
var currentNetworkAddress: String {
    var address : String = ""

    // Get list of all interfaces on the local machine:
    var ifaddr : UnsafeMutablePointer<ifaddrs>? = nil
    guard getifaddrs(&ifaddr) == 0 else { return address }
    guard let firstAddr = ifaddr else { return address }

        // For each interface ...
        for ifptr in sequence(first: firstAddr, next: { $0.pointee.ifa_next }) {
            let interface = ifptr.pointee

            // Check for IPv4 or IPv6 interface:
            let addrFamily = interface.ifa_addr.pointee.sa_family
            if [AF_INET.unsignedInt8Bit, AF_INET6.unsignedInt8Bit].contains([addrFamily])  {

                // Check interface name:
                let name = interface.ifa_name.string.lowerCased
                
                // Convert interface address to a human readable string:
                var hostname = [CChar](repeating: 0, count: Int(NI_MAXHOST))
                var temp = getnameinfo(interface.ifa_addr, socklen_t(interface.ifa_addr.pointee.sa_len),
                            &hostname, socklen_t(hostname.count),
                            nil, socklen_t(0), NI_NUMERICHOST)
                print(temp.description)
                address = hostname.string
            }
        }
        freeifaddrs(ifaddr)

        return address
}
