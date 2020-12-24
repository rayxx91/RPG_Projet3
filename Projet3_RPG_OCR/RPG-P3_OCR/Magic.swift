//
//  Magic.swift
//  RPG-P3_OCR
//
//  Created by chaleroux on 30/11/2020.
//

import Foundation

class Magic: Weapon {
    init() {
        super.init(name: "Magic", powerDamage: 0, powerHeal: 13)
    }
}

class GoldMagic: Weapon {
    init() {
        super.init(name: "Super White Magic", powerDamage: 0, powerHeal: 24)
    }
}
