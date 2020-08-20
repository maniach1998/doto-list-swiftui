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
    @State var title: String = ""
    @State var content: String = ""
    @State var date: Date = Date()
    @State var alertOpen: Bool = false
    let onComplete: (String, String, Date) -> Void
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Form {
                    Section(header: Text("CREATE A NEW DOTO BY FILLING THE FIELDS BELOW:")) {
                        TextField("Title", text: $title)
                        TextField("Description", text: $content)
                    }
                }
            }
            .navigationBarTitle(Text("Add Doto"), displayMode: .inline)
            .navigationBarItems(trailing: Button(action: addDotoAction) {
                Text("Create").foregroundColor(.green)
                }.alert(isPresented: self.$alertOpen) {
                    Alert(title: Text("Empty title!"), message: Text("The title field cannot be empty. Please enter some text for the Doto title."), dismissButton: .default(Text("OK")))
                }
            )
        }
    }
    
    private func addDotoAction() {
        if title.isEmpty {
            self.alertOpen = true
        } else {
            onComplete(title, content, date)
        }
    }
}
