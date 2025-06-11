//
//  RootView.swift
//  swiftUI_aentrena
//
//  Created by Álvaro Entrena Casas on 11/6/25.
//

import SwiftUI

struct RootView: View {
    @Environment(AppStateVM.self) var appState
    
    var body: some View {
        switch (appState.status) {
        case .none:
            Text("La app se inicia")
        case .loading:
            Text("La app esta cargando")
        case .loaded:
            Text("La app muestra los heros")
        case .error(error: let errorString):
            Text("Pantalla de error")
        }
    }
}

#Preview {
    RootView()
        .environment(AppStateVM())
}
