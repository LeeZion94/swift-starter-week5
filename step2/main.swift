//
//  main.swift
//  CodeStarterCamp_Week5
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class Person {
    var name: String
    var height: Int
    
    init(name: String, height: Int) {
        self.name = name
        self.height = height
    }
}

enum Level {
    case A, B, C
}

protocol Talent {
    var singing: Level? { get set }
    var dancing: Level? { get set }
    var acting: Level? { get set }
}

protocol BadPersonality {
    var frequancyOfCursing: Level? { get set }
}

class TalentedPerson: Person, Talent {
    var singing: Level?
    var dancing: Level?
    var acting: Level?
    
    init(name: String, height: Int, singing: Level, dancing: Level, acting: Level) {
        super.init(name: name, height: height)
        self.singing = singing
        self.dancing = dancing
        self.acting = acting
    }
    
}

class TalentedPersonWithBadPersonality: Person, Talent, BadPersonality {
    var singing: Level?
    var dancing: Level?
    var acting: Level?
    var frequancyOfCursing: Level?
    
    init(name: String, height: Int, singing: Level, dancing: Level, acting: Level, frequancyOfCursing: Level) {
        super.init(name: name, height: height)
        self.singing = singing
        self.dancing = dancing
        self.acting = acting
        self.frequancyOfCursing = frequancyOfCursing
    }
    
}

struct AuditionManager {
    var totalApplicantsList: [Person]
    var passedApplicationsList: [Person]
    
    mutating func cast() -> [Person] {
        for number in 0..<totalApplicantsList.count {
            if (totalApplicantsList[number] is Talent) && ((totalApplicantsList[number] is BadPersonality) == false) {
                let talentedPerson = totalApplicantsList[number] as? TalentedPerson
                if talentedPerson?.singing == .A || talentedPerson?.dancing == .A || talentedPerson?.acting == .A {
                    passedApplicationsList.append(totalApplicantsList[number])
                }
            }
        }
        
        return passedApplicationsList

    }
    
    func annoucePassedApplicants(selectedApplicants: [Person]) {
        print("---합격자 명단---")
        for person in selectedApplicants {
            print("\(person.name)")
        }
        print("--------------")
        print("축하합니다!!🥳")
    }
}

let harry = TalentedPerson(name: "harry", height: 180, singing: .A, dancing: .B, acting: .C)
let wongbing = TalentedPerson(name: "wongbing", height: 300, singing: .C, dancing: .A, acting: .B)
let watermellon = TalentedPerson(name: "catlover", height: 175, singing: .B, dancing: .C, acting: .A)
let yagom = TalentedPerson(name: "yahangom", height: 1000, singing: .A, dancing: .A, acting: .A)
let jinho = TalentedPerson(name: "kongggajima", height: 222, singing: .B, dancing: .B, acting: .B)

let voldemort = TalentedPersonWithBadPersonality(name: "Tom", height: 168, singing: .A, dancing: .A, acting: .A, frequancyOfCursing: .A)

let potter = Person(name: "potter", height: 175)

var god = AuditionManager(totalApplicantsList: [ harry, wongbing, watermellon, yagom, jinho, voldemort], passedApplicationsList: [])

god.annoucePassedApplicants(selectedApplicants: god.cast())

