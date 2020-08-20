//
//  ContentView.swift
//  DotoList
//
//  Created by Manas Acharekar on 8/19/20.
//  Copyright © 2020 Manas Acharekar. All rights reserved.

import SwiftUI

// swiftlint:disable multiple_closures_with_trailing_closure
struct ContentView: View {
    
    @State var dotos: [Doto] = ContentView.makeDefaultDotos()
    @State var modalOpen: Bool = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(dotos, id: \.id) { doto in
                    DotoRow(doto: doto)
                }.onDelete(perform: deleteDoto)
            }
            .navigationBarTitle(Text("Doto List"))
            .navigationBarItems(trailing: Button(action: {
                self.modalOpen.toggle()
                
            }, label: {
                Image(systemName: "plus").imageScale(.large).foregroundColor(.black)
            }).sheet(isPresented: $modalOpen) {
                AddDotoView { title, content, date in
                    self.addDoto(title: title, content: content, date: date)
                    self.modalOpen = false
                }
            })
        }
    }
    
    func deleteDoto(at offsets: IndexSet) {
        dotos.remove(atOffsets: offsets)
    }
    
    func addDoto(title: String, content: String, date: Date) {
        let newDoto = Doto(id: UUID(), title: title, content: content, date: date)
        dotos.append(newDoto)
    }
    
    static func makeDefaultDotos() -> [Doto] {
        let dotoOne = Doto(id: UUID(), title: "Doto one", content: "This is the first Doto", date: Date())
        let dotoTwo = Doto(id: UUID(), title: "Doto two", content: "Second doto of the day", date: Date().addingTimeInterval(.pi))
        
        return [dotoOne, dotoTwo]
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
