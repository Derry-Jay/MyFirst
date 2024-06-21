//
//  Continuations.swift
//  MyFirst
//
//  Created by admin on 21/06/24.
//

import Foundation

extension String? {
    var fromAsset: URL? {
        let fl = self?.components(separatedBy: ".") ?? [String](), name = fl.first, ext = fl.last
        return Bundle.main.url(forResource: name, withExtension: ext)
    }
}

extension UnsafeMutablePointer<CChar>? {
    var string: String {
        do {
            return String(cString: self!)
        } catch {
            return ""
        }
    }
}
