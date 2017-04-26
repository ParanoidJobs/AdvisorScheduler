//
//  DataService.swift
//  Advisor-Scheduler
//
//  Created by Samuel Zamudio on 4/26/17.
//  Copyright © 2017 Paranoid-Jobs. All rights reserved.
//

import Foundation
import Firebase

let DB_BASE = FIRDatabase.database().reference()

class DataService {
    static let ds = DataService()
    
    private var _REF_BASE = DB_BASE
    private var _REF_APPS = DB_BASE.child("Appointments")
    private var _REF_INTS = DB_BASE.child("Instructors")
    private var _REF_STUDS = DB_BASE.child("Students")
    
    var REF_BASE: FIRDatabaseReference {
        return _REF_BASE
    }
    
    var REF_APPS: FIRDatabaseReference {
        return _REF_APPS
    }
    
    var REF_INTS: FIRDatabaseReference {
        return _REF_INTS
    }
    
    var REF_STUDS: FIRDatabaseReference {
        return _REF_STUDS
    }
    
    func createInstructor(uid: String, userData: Dictionary<String, String>) {
        REF_INTS.child(uid).updateChildValues(userData)
    }
    
    func createStudent(uid: String, userData: Dictionary<String, String>) {
        REF_STUDS.child(uid).updateChildValues(userData)
    }
    
}
