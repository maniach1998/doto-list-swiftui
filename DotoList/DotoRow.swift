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
                Text(doto.title).font(.headline)
                Spacer()
                Text(doto.description).font(.subheadline).fontWeight(.light).foregroundColor(.gray)
            }
            Spacer()
            Text("\(doto.date, formatter: Self.dateFormat)").fontWeight(.light)
        }.padding(.vertical)
    }
}
