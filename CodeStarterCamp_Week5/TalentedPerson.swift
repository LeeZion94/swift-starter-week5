//
//  TalentedPerson.swift
//  CodeStarterCamp_Week5
//
//  Created by Hyejeong Jeong on 2022/11/15.
//

import Foundation

class TalentedPerson: Person, Talent {
    var singing: Level
    var dancing: Level
    var acting: Level
    
    init(name: String, height: Int, singing: Level, dancing: Level, acting: Level) {
        self.singing = singing
        self.dancing = dancing
        self.acting = acting
        super.init(name: name, height: height)
    }
}