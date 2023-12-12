//
//  ContentViewModel.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 21.10.23.
//

import Foundation
import Firebase
import Combine
import FirebaseAuth

/// A Model that manages data related to user sessions and current user information.
class ContentViewModel: ObservableObject {
    
    private let service = SLAuthService.shared
    private var canellables = Set<AnyCancellable>()
    
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    /// Initializes the ContentViewModel.
    init() {
        setupSubscribers()
    }
    
    /// Sets up Combine subscribers for user session and current user.
    func setupSubscribers() {
        service.$userSession.sink { [weak self] userSession in
            self?.userSession = userSession
        }
        .store(in: &canellables)
        
        service.$currentUser.sink { [weak self] currentUser in
            self?.currentUser = currentUser
        }
        .store(in: &canellables)
    }
}
