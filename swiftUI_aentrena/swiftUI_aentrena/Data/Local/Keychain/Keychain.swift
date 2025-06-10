//
//  Keychain.swift
//  swiftUI_aentrena
//
//  Created by Álvaro Entrena Casas on 2/6/25.
//

import Foundation
import KeychainSwift
import Security

public struct KeyChainKC {
    public init() {
        
    }
    
    // Funcion para guardar
    @discardableResult
    public func saveKC (key: String, value: String) -> Bool {
        let keychain = KeychainSwift()
        
        if let data = value.data(using: .utf8) {
            //let keychain = KeyChainKC()
            return keychain.set(data, forKey: key)
        } else {
            return false
        }
    }
    // Funcion para cargar
    public func loadKC(key: String) -> String? {
        if let data = KeychainSwift().get(key) {
            return data
        } else {
            // NO exite la clave
            return "" // o nil
        }
    }
    // Funcion para eliminar
    @discardableResult
    public func deleteKC(key: String) -> Bool {
        return KeychainSwift().delete(key)
        
    }
    
}
