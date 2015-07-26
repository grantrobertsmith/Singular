//
//  Name.swift
//  Singular
//
//  Created by Grant Smith on 7/25/15.
//  Copyright (c) 2015 InfoSync. All rights reserved.
//

import UIKit

class Name: NSObject, NSCoding {


    // MARK: Properties
    var name: String
    var signature: UIImage?
    
    struct PropertyKey {
        static let nameKey = "name"
        static let signatureKey = "signature"
    }
    
    
    // MARK: Archiving Paths
    static let DocumentsDirectory: AnyObject = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.URLByAppendingPathComponent("name")
    
    
    // MARK: Initialization
    init(signature: UIImage?, name: String = "") {
        // Initialize stored properties.
        self.name = name
        self.signature = signature
        
        super.init()
    }
    
    
    // MARK: NSCoding
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name, forKey: PropertyKey.nameKey)
        aCoder.encodeObject(signature, forKey: PropertyKey.signatureKey)
    }
    
    required convenience init(coder aDecoder: NSCoder) {
        let name = aDecoder.decodeObjectForKey(PropertyKey.nameKey) as! String
        let signature = aDecoder.decodeObjectForKey(PropertyKey.signatureKey) as? UIImage
        
        // Must call designated initilizer.
        self.init(signature: signature, name: name)
    }
    
    
}
