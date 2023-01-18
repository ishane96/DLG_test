//
//  Localizator.swift
//  DLG_Test
//
//  Created by Achintha kahawalage on 2023-01-17.
//

import UIKit

public class Localizator {
    fileprivate func NSLocalizedString(_ key: String) -> String {
        return Foundation.NSLocalizedString(key, comment: "")
    }
}

extension String {
    //Navigation Titles
    static let NewFeature = NSLocalizedString("NEW FEATURE", comment: "").uppercased()
    static let Search = NSLocalizedString("SEARCH TOOL", comment: "").uppercased()

    //New feature labels
    static let makingCarsEasy = NSLocalizedString("MAKING CARS EASY.", comment: "").uppercased()
    static let WeGotBrilliant = NSLocalizedString("We've got a brilliant new vehicle search feature.. why not give it a try!", comment: "")
    static let TryButton = NSLocalizedString("TRY IT OUT", comment: "").uppercased()
    static let GoButton = NSLocalizedString("GO", comment: "").uppercased()
    
    
    //Search Tool labels
    static let WhatsYourVehicleReg = NSLocalizedString("WHAT'S YOUR VEHICLE REG?", comment: "").uppercased()
    static let TextFieldPlaceHolder = NSLocalizedString("ENTER REG", comment: "").uppercased()

    static let Make = NSLocalizedString("Make", comment: "").uppercased()
    static let Model = NSLocalizedString("Model", comment: "").uppercased()
    static let Details = NSLocalizedString("Details", comment: "").uppercased()
    static let BodyType = NSLocalizedString("Body Type", comment: "").uppercased()
    static let Engine = NSLocalizedString("Engine", comment: "").uppercased()
    static let Year = NSLocalizedString("Year", comment: "").uppercased()
    static let Gear = NSLocalizedString("Gear", comment: "").uppercased()
    static let Mot = NSLocalizedString("Mot", comment: "").uppercased()
    
    //Optionals
    static let NA = NSLocalizedString("N/A", comment: "").uppercased()
    
    //Errors
    static let ErrorMsg = NSLocalizedString("Uh-oh! We Couldn't find a vehicle with that registration", comment: "")
    static let ErrorHint = NSLocalizedString("Try Searching 'XXYYZZZ'...", comment: "")

    
}
