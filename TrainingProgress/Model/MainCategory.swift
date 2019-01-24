//
//  MainCategory.swift
//  TrainingProgress
//
//  Created by Mariusz Gil on 07/01/2019.
//  Copyright © 2019 Mariusz Gil. All rights reserved.
//

import Foundation
import RealmSwift

class MainCategory: Object{
    
    @objc dynamic var mainName: String = ""
    let exercisesList = List<Exercise>()
    
}
