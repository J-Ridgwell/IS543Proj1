//
//  Pushup.swift
//  IS543Proj1
//
//  Created by Jacob Ridgwell on 9/26/19.
//  Copyright © 2019 Jacob Ridgwell. All rights reserved.
//

import Foundation

class PushupData: Codable {
    
    // MARK: - Properties

    var pushupSessions: [PushupSession] = []
    var totalPushups: Int = 0
    
    // MARK: - Singleton Pattern
    
    static let sharedInstance = PushupData()
    
    private init() {
        
        pushupSessions = []
        totalPushups = 0

        for i in pushupSessions {
            totalPushups += i.numPushups 
        }
    
    }
    
    // MARK: - Computed
    
    // MARK: - Helpers
    
    func setSessions(sessions: [PushupSession]) {
        self.pushupSessions = []
        print("In set sessions: \(sessions)")
        self.pushupSessions.append(contentsOf: sessions)
        print("In set sessions AFter set: \(sessions)")
    }
    
    func setTotalPushups(total: Int) {
        self.totalPushups = total
    }
    
    private enum CodingKeys: String, CodingKey {
        case pushupSessions
        case totalPushups
    }

    required init(from decoder:Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        pushupSessions = try values.decode([PushupSession].self, forKey: .pushupSessions)
        totalPushups = try values.decode(Int.self, forKey: .totalPushups)
    }


}
