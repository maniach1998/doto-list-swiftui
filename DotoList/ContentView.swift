//
//  ContentView.swift
//  DotoList
//
//  Created by Manas Acharekar on 8/19/20.
//  Copyright © 2020 Manas Acharekar. All rights reserved.

import SwiftUI

struct ContentView: View {
    
    // MARK:- Environment vars and declarations
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(
        entity: Doto.entity(),
        sortDescriptors: [
            NSSortDescriptor(keyPath: \Doto.date, ascending: true)
        ]
    ) var dotos: FetchedResults<Doto>
    @State var modalOpen: Bool = false
    
    // MARK:- View body
    var body: some View {
        NavigationView {
            List {
                ForEach(dotos, id: \.id) {
                    DotoRow(doto: $0)
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
    
    // MARK:- Delete function
    func deleteDoto(at offsets: IndexSet) {
        offsets.forEach { index in
            let doto = self.dotos[index]
            self.managedObjectContext.delete(doto)
        }
        
        saveContext()
    }
    
    // MARK:- Add function
    func addDoto(title: String, content: String, date: Date) {
        let newDoto = Doto(context: managedObjectContext)
        
        newDoto.id = UUID()
        newDoto.title = title
        newDoto.content = content
        newDoto.date = date
        
        saveContext()
    }
    
    // MARK:- Managed object saving support
    func saveContext() {
        do {
            try managedObjectContext.save()
        } catch {
            print("Error saving managed object: \(error)")
        }
    }
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
