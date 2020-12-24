//
//  Axe.swift
//  RPG-P3_OCR
//
//  Created by chaleroux on 30/11/2020.
//

import Foundation

class Axe: Weapon {
    init() {
        super.init(name: "axe", powerDamage: 19, powerHeal: 0)
    }
}

class GoldAxe: Weapon {
    init() {
        super.init(name: "Gold Axe", powerDamage:36, powerHeal: 0)
    }
}
