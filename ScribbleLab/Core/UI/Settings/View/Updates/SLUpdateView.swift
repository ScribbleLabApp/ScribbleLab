//
//  SLUpdateView.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 08.10.23.
//

import SwiftUI

struct SLUpdateView: View {
    @StateObject var updateModel = SLUpdateViewModel()
    
    var body: some View {
        NavigationStack {
            
            Text("Update")
                .navigationTitle("Updates")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    SLUpdateView()
}
