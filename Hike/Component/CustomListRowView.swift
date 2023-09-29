//
//  CustomListRowView.swift
//  Hike
//
//  Created by Irving Lop on 29/09/23.
//

import SwiftUI

struct CustomListRowView: View {
    
    @State var rowLabel: String
    @State var rowIcon: String
    @State var rowContent: String
    @State var rowTintColor: Color
    @State var rowLinkDestination: String? = nil
    
    var body: some View {
        LabeledContent {
            if rowLinkDestination == nil {
                Text(rowContent)
                    .foregroundColor(.primary)
                .fontWeight(.heavy)
            } else {
                Link(rowContent, destination: URL(string: rowLinkDestination!)!)
                    .foregroundColor(.pink)
                    .fontWeight(.heavy)
            }
        } label: {
            HStack{
                ZStack{
                    RoundedRectangle(cornerRadius: 8)
                        .frame(width: 30, height: 30)
                        .foregroundColor(rowTintColor)
                    Image(systemName: rowIcon)
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                }
                
                Text(rowLabel)
            }
        }
    }
}

struct CustomListRowView_Previews: PreviewProvider {
    static var previews: some View {
        List() {
            CustomListRowView(rowLabel: "Developer", rowIcon: "paintpalette", rowContent: "Irving Dev", rowTintColor: .blue)
        }
    }
}
