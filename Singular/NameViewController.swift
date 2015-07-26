//
//  NameViewController.swift
//  Singular
//
//  Created by Grant Smith on 7/25/15.
//  Copyright (c) 2015 InfoSync. All rights reserved.
//

import UIKit

class NameViewController: UIViewController, UITextFieldDelegate {


    // MARK: Properties
    var name = Name(signature: nil)
    
    @IBOutlet weak var nameTextField: UITextField!
    
    
    // MARK: LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Handle the text field’s user input through delegate callbacks.
        nameTextField.delegate = self
        
        // Load saved name, if any
        if let savedName = loadName() {
            name = savedName
            
            nameTextField.text = name.name
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: UITextFieldDelegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        // Hide the keyboard.
        nameTextField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        name.name = nameTextField.text

        saveNameInfo()
    }
    
    
    // MARK: NSCoding
    func saveNameInfo() {
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(name, toFile: Name.ArchiveURL.path!)
        if !isSuccessfulSave {
            print("Failed to save name...")
        }
    }
    
    func loadName() -> Name? {
        return NSKeyedUnarchiver.unarchiveObjectWithFile(Name.ArchiveURL.path!) as? Name
    }
    
    
}
