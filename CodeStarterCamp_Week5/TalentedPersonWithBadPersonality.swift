//
//  TalentedPersonWithBadPersonality.swift
//  CodeStarterCamp_Week5
//
//  Created by Hyejeong Jeong on 2022/11/15.
//

import Foundation

class TalentedPersonWithBadPersonality: Person, Talent, BadPersonality {
    var singing: Level
    var dancing: Level
    var acting: Level
    var frequancyOfCursing: Level

    init(name: String, height: Int, singing: Level, dancing: Level, acting: Level, frequancyOfCursing: Level) {
        self.singing = singing
        self.dancing = dancing
        self.acting = acting
        self.frequancyOfCursing = frequancyOfCursing
        super.init(name: name, height: height)
    }
}