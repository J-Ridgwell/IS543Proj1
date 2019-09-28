//
//  ViewController.swift
//  IS543Proj1
//
//  Created by Jacob Ridgwell on 9/25/19.
//  Copyright © 2019 Jacob Ridgwell. All rights reserved.
//

import UIKit

class AddItViewController: UIViewController {

    // MARK: - Properties
    
    @IBOutlet weak var numPushups: UITextField!

    @IBOutlet weak var datePicker: UIDatePicker!
    
    let pushupData: PushupData = PushupData.sharedInstance
        
    private enum sessionsEnum: String {
        case sessions
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        restoreHistory()
        
    }
        
    
    // MARK: - Action
    @IBAction func addPushupSession(_ sender: UIButton) {
        if (numPushups.text! != "") && Int(numPushups.text!) != 0 {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd-M-YYYY"
            let strDate = dateFormatter.string(from: datePicker.date)
            
            pushupData.pushupSessions.append(PushupSession(amount: Int(numPushups.text!)!, date: strDate))
            
            pushupData.totalPushups += Int(numPushups.text!)!
            
            saveHistory()
            
            self.performSegue(withIdentifier: "unwindToHome", sender: self)
            
        }
        
    }
    
    // MARK: - Helpers
    
    
    private func saveHistory() {
        let history = UserDefaults.standard
        
        history.set(try? PropertyListEncoder().encode(PushupData.sharedInstance),
                    forKey: "pushupSessions")

                history.synchronize()
    }
    
    private func restoreHistory() {
        let history = UserDefaults.standard
        
        
        // Find encoded obj in storage
        guard let pushupSessionHistory = history.object(forKey: "pushupSessions") as? Data else {
            print("error in hist")
            return
        }
        
        // Use PropertyListDecoder to convert Data into PushupData
        guard let oldPushupData = try? PropertyListDecoder().decode(PushupData.self, from: pushupSessionHistory) else {
            print("Error in decode")
            return
        }
        
        // Add stored data to singleton
        PushupData.sharedInstance.setSessions(sessions: oldPushupData.pushupSessions)

        PushupData.sharedInstance.setTotalPushups(total: oldPushupData.totalPushups) 

        
    }

    
    
    
    // MARK: - Segues
    
    @IBAction func exitModalScene(_ segue: UIStoryboardSegue) {
        
    }
}

