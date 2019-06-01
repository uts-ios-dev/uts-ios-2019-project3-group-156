//
//  firebaseManager.swift
//  Focus booster
//
//  Created by Ke Zhang on 1/6/19.
//  Copyright © 2019 Theron Ann. All rights reserved.
//

import Foundation
import Firebase
import FirebaseAuth

class firebaseManager {
    
    static let shares = firebaseManager()
    let db = Firestore.firestore()
    
    var currentUid: String? {
        return Auth.auth().currentUser?.uid
    }
    
    
    
   
    
    
    
}
