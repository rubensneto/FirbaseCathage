//
//  FBTest.swift
//  FirbaseCathage
//
//  Created by Brett Schumann on 18/09/2018.
//  Copyright © 2018 T101. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase

public class FBTest: NSObject {
    
    var ref: DatabaseReference!
    var handle: DatabaseHandle!
    
    public func configureFirebase() {
        FirebaseApp.configure()
        ref = Database.database().reference(fromURL: "https://updatemystring.firebaseio.com/")
    }
    
    public func addObserver()-> String?{
        let stringRef = ref.child("string")
        stringRef.observeSingleEvent(of: .value, with: { (snapshot) in
            self.handle = stringRef.observe(.value, with: { (snapshotChild) in
                return snapshotChild.value as! String
            }, withCancel: { (error) in
                print(error.localizedDescription)
            })
        }) { (error) in
            print(error.localizedDescription)
        }
        return nil
    }
}
