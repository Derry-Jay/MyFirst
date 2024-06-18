//
//  Extensions.swift
//  MyFirst
//
//  Created by admin on 18/06/24.
//

import Network
import SwiftUI
import Foundation

extension String {
    var text: Text {
        return Text(self)
    }
    
    var uri: URL? {
     return URL(string: self)
    }
    
    var ipV4Addr: IPv4Address? {
        return IPv4Address(self)
    }
    
    var upperCased: String {
        return self.uppercased()
    }
    
    var lowerCased: String {
        return self.lowercased()
    }
    
    var picFromAsset: UIImage? {
        return UIImage(named: self)
    }
    
    var icon: Image {
        return Image(systemName: self)
    }
    
    var ipV4Int: UInt32? {
        let ipad = self.ipV4Addr
        print(ipad?.debugDescription as Any)
        print(ipad?.rawValue as Any)
        return ipad?.rawValue.withUnsafeBytes {
            $0.load(as: UInt32.self)
        }
    }
    
    var name: String {
        let ip = self.trimmingCharacters(in: .whitespacesAndNewlines), nl = ip.components(separatedBy: "-"), fn = nl.first?.firstLetterCapitalized ?? "", ln = nl.last?.firstLetterCapitalized ?? ""
        return fn + " " + ln
    }
    
    var firstLetterCapitalized: String {
        let ip = self.trimmingCharacters(in: .whitespacesAndNewlines), p1 = String(ip.prefix(1)),p2=String(ip.suffix(ip.count - 1))
        print(TARGET_OS_SIMULATOR)
        return p1.upperCased + p2.lowerCased
    }
    
    var signal: Bool {
        let ip = self.trimmingCharacters(in: .whitespacesAndNewlines), il = ip.lowerCased, iu = ip.upperCased, inu = Int(ip) ?? 0
        return !ip.isEmpty && (il == "true" ||
                                 iu == "TRUE" ||
                                 il == "yes" ||
                                 iu == "YES" ||
                                 il == "ok" ||
                               iu == "OK" || inu > 0)
    }
}
