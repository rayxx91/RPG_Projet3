//
//  Bow.swift
//  RPG-P3_OCR
//
//  Created by chaleroux on 30/11/2020.
//

import Foundation

class Bow: Weapon {
    init() {
        super.init(name: "Bow", powerDamage: 14, powerHeal: 0)
    }
}

class GoldBow: Weapon {
    init() {
        super.init(name: "Gold Bow", powerDamage: 29, powerHeal: 0)
    }
}
