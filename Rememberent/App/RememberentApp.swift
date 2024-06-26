//
//  RememberentApp.swift
//  Rememberent
//
//  Created by Alexei Egorov on 10/06/2024.
//

import SwiftUI

@main
struct RememberentApp: App {
    
    // MARK: - Properties
    
    private let viewModel: RememberentAppViewModel = RememberentAppViewModel()
    
    // MARK: - App Scene
    
    var body: some Scene {
        WindowGroup {
            HomeView(viewModel: viewModel.homeViewModel)
        }
    }
}
