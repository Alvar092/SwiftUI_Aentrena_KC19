//
//  extension+ContantsApp.swift
//  swiftUI_aentrena
//
//  Created by Álvaro Entrena Casas on 10/6/25.
//

import Foundation
import CryptoKit

extension ConstantsApp {
    static var HASH: String {
        let toHash = "\(TS)\(PRIVATE_KEY)\(PUBLIC_KEY)"
        return Insecure.MD5.hash(data: Data(toHash.utf8)).map{String(format: "%02hhx", $0)}.joined()
    }
}
