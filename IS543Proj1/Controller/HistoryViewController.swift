//
//  HistoryController.swft.swift
//  IS543Proj1
//
//  Created by Jacob Ridgwell on 9/27/19.
//  Copyright © 2019 Jacob Ridgwell. All rights reserved.
//

import UIKit

class HistoryViewController: UITableViewController {
    
    @IBOutlet weak var totalPushupsDisplay: UILabel!
    
    
    // MARK: - Constants
    
    private struct Storyboard {
        static let numPushupCellIdent = "numPushupsCell"
    }
    
    private enum sessionsEnum: String {
        case sessions
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        totalPushupsDisplay?.text = String(PushupData.sharedInstance.totalPushups)
    }
    
    
    // MARK: - Restore
    
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.numPushupCellIdent, for: indexPath)
        
        let pushupSessions = PushupData.sharedInstance.pushupSessions
        
        
        cell.textLabel?.text = pushupSessions[indexPath.row].toString()
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PushupData.sharedInstance.pushupSessions.count
    }
}

