//
//  DotoRow.swift
//  DotoList
//
//  Created by Manas Acharekar on 8/20/20.
//  Copyright © 2020 Manas Acharekar. All rights reserved.
//

import SwiftUI

struct DotoRow: View {
    
    var doto: Doto
    
    static let dateFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }()
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                doto.title.map(Text.init)?
                    .font(.headline)
                
                Spacer()
                
                doto.content.map(Text.init)?
                    .fontWeight(.light)
                    .foregroundColor(.gray)
                    .font(.subheadline)
            }
            Spacer()
            doto.date.map {
                Text(Self.dateFormat.string(from: $0))
                }?
                .fontWeight(.light)
        }.padding(.vertical)
    }
}
