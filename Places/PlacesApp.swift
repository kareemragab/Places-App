//
//  PlacesApp.swift
//  Places
//
//  Created by Kareem Ragab Hassan on 27/11/2023.
//

import SwiftUI

@main
struct PlacesApp: App {
    @StateObject var viewModel = locationViewModel()

    var body: some Scene {
        WindowGroup {
            LocationView().environmentObject(viewModel)
        }
    }
}
