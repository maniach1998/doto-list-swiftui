//
//  ContentView.swift
//  DotoList
//
//  Created by Manas Acharekar on 8/19/20.
//  Copyright © 2020 Manas Acharekar. All rights reserved.
//

import SwiftUI

struct Doto: Identifiable {
    var id: UUID
    var title: String
    var description: String
    var date: Date
}


struct ContentView: View {
    
    @State var dotos: [Doto] = [
    Doto(id: UUID(), title: "Doto one", description: "This is the first Doto", date: Date()),
    Doto(id: UUID(), title: "Doto two", description: "Second doto of the day", date: Date().addingTimeInterval(.pi)),
    ]
    @State var modalOpen: Bool = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(dotos, id: \.id) { doto in
                    DotoRow(doto: doto)
                }
            }
            .navigationBarTitle(Text("Doto List"))
            .navigationBarItems(trailing: Button(action: {
                self.modalOpen.toggle()
                
            }, label: {
                Image(systemName: "plus").imageScale(.large).foregroundColor(.black)
            }).sheet(isPresented: $modalOpen) {
                AddDotoView(modalOpen: self.$modalOpen, dotos: self.$dotos)
            })
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
