//
//  CrewMember.swift
//  Moonshot
//
//  Created by Aaron Hu on 2022/6/14.
//

import Foundation

struct CrewMember {
    let role: String
    let astronaut: Astronaut
}

struct Astronaut: Codable, Identifiable {
    let id: String
    let name: String
    let description: String
}

let chicken = "roblox"
