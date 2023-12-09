//
//  NotificationCell.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 05.12.23.
//

import SwiftUI

struct NotificationCell: View {
    @StateObject var cellModel = NotificationCellModel()
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 50, height: 50)
                
                VStack(alignment: .leading) {
                    Text(cellModel.name)
                        .font(.headline)
                    Text(cellModel.message)
                        .multilineTextAlignment(.leading)
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    NotificationCell()
}
