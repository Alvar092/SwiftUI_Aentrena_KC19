//
//  swiftUI_aentrenaApp.swift
//  swiftUI_aentrena
//
//  Created by Álvaro Entrena Casas on 2/6/25.
//

import SwiftUI

@main
struct swiftUI_aentrenaApp: App {
    
//    @State var AppState = AppStateVM()
    
    var body: some Scene {
        WindowGroup {
            CharactersView()
//                .environment(AppState)
        }
    }
}
