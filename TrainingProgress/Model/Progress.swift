//
//  Progress.swift
//  TrainingProgress
//
//  Created by Mariusz Gil on 07/01/2019.
//  Copyright © 2019 Mariusz Gil. All rights reserved.
//

import Foundation
import RealmSwift

class Progress: Object{
    
    @objc dynamic var weight: String = ""
    @objc dynamic var currentDateTime = Date()

    var progressParentCategory = LinkingObjects(fromType: Exercise.self, property: "progressList")
    
}
