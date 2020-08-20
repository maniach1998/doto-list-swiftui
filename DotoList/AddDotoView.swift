//
//  AddDotoView.swift
//  DotoList
//
//  Created by Manas Acharekar on 8/20/20.
//  Copyright © 2020 Manas Acharekar. All rights reserved.
//

import SwiftUI
import Foundation

struct AddDotoView: View {
    @Binding var modalOpen: Bool
    @Binding var dotos: [Doto]
    @State var name: String = ""
    @State var description: String = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack {
                Text("Add Doto").font(.largeTitle).fontWeight(.bold).padding()
            }
            .padding(.top)
            
            Form {
                Section(header: Text("CREATE A NEW DOTO BY FILLING THE FIELDS BELOW:")) {
                    TextField("Name", text: $name)
                    TextField("Description", text: $description)
                }
                
                Section {
                    Button(action: {
                        self.dotos.append(Doto(id: UUID(), title: self.name, description: self.description, date: Date()))
                        self.modalOpen.toggle()
                    }) {
                        Text("Submit").foregroundColor(.green)
                    }

                    Button(action: {
                        self.modalOpen.toggle()
                    }) {
                        Text("Go Back").foregroundColor(.red)
                    }
                }
            }
        }
    }
}
