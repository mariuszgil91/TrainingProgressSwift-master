//
//  Exercise.swift
//  TrainingProgress
//
//  Created by Mariusz Gil on 07/01/2019.
//  Copyright © 2019 Mariusz Gil. All rights reserved.
//

import Foundation
import RealmSwift

class Exercise: Object{
    
    @objc dynamic var exerciseName: String = ""
    let progressList = List<Progress>()
    let exerciseParentCategory = LinkingObjects(fromType: MainCategory.self, property: "exercisesList")
    
}
