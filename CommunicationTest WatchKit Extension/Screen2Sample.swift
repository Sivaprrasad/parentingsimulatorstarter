//
//  Screen2Sample.swift
//  CommunicationTest WatchKit Extension
//
//  Created by Parrot on 2019-10-31.
//  Copyright © 2019 Parrot. All rights reserved.
//

import Foundation
import WatchKit
import WatchConnectivity

class Screen2Sample: WKInterfaceController, WCSessionDelegate {
    
    public var pokemonGivenName: String=""
    
    // MARK: Outlets
    // ---------------------

    // 1. Outlet for the image view
    @IBOutlet var pokemonImageView: WKInterfaceImage!
    
    // 2. Outlet for the label
    @IBOutlet var nameLabel: WKInterfaceLabel!
    
    // MARK: Delegate functions
    // ---------------------
    
    // Default function, required by the WCSessionDelegate on the Watch side
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        //@TODO
    }
    
    // MARK: WatchKit Interface Controller Functions
    // ----------------------------------
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        
        // 1. Check if the watch supports sessions
        if WCSession.isSupported() {
            WCSession.default.delegate = self
            WCSession.default.activate()
        }
        
        
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    
    // MARK: Actions
    @IBAction func startButtonPressed() {
        print("Start button pressed")
    }
    
    
    @IBAction func selectNameButtonPressed() {
        print("select name button pressed")
        
        // 1. Show the built in UI for accepting user input
        let cannedResponses = ["Siva", "Prudhvi", "Karthik", "Bala"]
        presentTextInputController(withSuggestions: cannedResponses, allowedInputMode: .plain) {
            
            (results) in
            
            if (results != nil && results!.count > 0) {
                // 2. write your code to process the person's response
                let userResponse = results?.first as? String
                print(userResponse!)
                self.nameLabel.setText(userResponse)
                self.pokemonGivenName = userResponse!
                
            }
        }
    }
    

}
