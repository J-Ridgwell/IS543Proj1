//
//  PushupSession.swift
//  IS543Proj1
//
//  Created by Jacob Ridgwell on 9/27/19.
//  Copyright © 2019 Jacob Ridgwell. All rights reserved.
//

import Foundation

struct PushupSession: Codable {
    
    var numPushups: Int
    var date: String

    func toString() -> String {
        return "Date: \(date)                   Amount: \(numPushups)"
    }
    
    init(amount numPushups: Int, date: String) {
        self.numPushups = numPushups
        self.date = date
    }
}
