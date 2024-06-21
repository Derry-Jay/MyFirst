//
//  Extensions.swift
//  MyFirst
//
//  Created by admin on 18/06/24.
//

import Network
import SwiftUI
import Foundation

extension UIColor {
    var color: Color {
        return Color(self)
    }
}

extension Color {
    var uiColor: UIColor {
        return UIColor(self)
    }
}

extension Int32 {
    var unsignedInt8Bit: UInt8 {
        return UInt8(self)
    }
}

extension [CChar] {
    var string: String {
        return String(cString: self)
    }
}

extension UnsafeMutablePointer<CChar> {
    var string: String {
        return String(cString: self)
    }
}

extension URLSessionConfiguration {
    var uriSesh: URLSession {
        return URLSession(configuration: self)
    }
}

extension CGColor {
    var color: Color {
        return Color(cgColor: self)
    }
    
    var uiColor: UIColor {
        return UIColor(cgColor: self)
    }
}

extension Int {
    var factorial: Int {
        return self < 0 ? 0 : (self == 0 || self == 1 ? 1 : (self * (self - 1).factorial))
    }
    
    subscript(digitIndex: Int) -> Int {
            var decimalBase = 1
            for _ in 0..<digitIndex {
                decimalBase *= 10
            }
            return (self / decimalBase) % 10
        }
    
    var kind: Kind {
        switch self {
        case 0:
            return .zero
        case let x where x > 0:
            return .positive
        default:
            return .negative
        }
    }

}

extension Double {
        var kind: Kind {
            switch self {
            case 0.0:
                return .zero
            case let x where x > 0.0:
                return .positive
            default:
                return .negative
            }
        }
}

extension UIScreen {
    var screenBounds: CGRect  {
        return mainScreen.bounds
    }

    var screenSize: CGSize {
        return screenBounds.size
    }
    
    var screenWidth: CGFloat {
        return screenSize.width
    }
    
    var screenHeight: CGFloat {
        return screenSize.height
    }
 }

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
    
    var uiColor: UIColor? {
        return UIColor(named: self)
    }
    
    var icon: Image {
        return Image(systemName: self)
    }
    
    
    func getColor(bdl: Bundle? = nil) -> Color {
        return Color(self, bundle: bdl)
    }
    
    func getUIColor(bdl: Bundle? = nil, cWith: UITraitCollection? = nil) -> UIColor? {
        return UIColor(named: self, in: bdl, compatibleWith: cWith)
    }
    
    var ipV4Int: UInt32? {
        let ipad = self.ipV4Addr
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
