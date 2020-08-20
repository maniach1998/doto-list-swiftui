//
//  Doto.swift
//  DotoList
//
//  Created by Manas Acharekar on 8/20/20.
//  Copyright © 2020 Manas Acharekar. All rights reserved.
//

import Foundation

struct Doto: Identifiable {
    var id: UUID
    var title: String
    var content: String
    var date: Date
}
