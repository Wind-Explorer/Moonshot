//
//  MissionViewScroll.swift
//  Moonshot
//
//  Created by Adam Chen JingFan on 2022/6/14.
//

import SwiftUI

struct MissionViewScroll: View {
    let mission: Mission
    let crew: [CrewMember]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(crew, id: \.role) { crewMember in
                    NavigationLink {
                        AstronautView(astronaut: crewMember.astronaut)
                    } label: {
                        HStack {
                            Image(crewMember.astronaut.id)
                                .resizable()
                                .frame(width: 104, height: 72)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .strokeBorder(.white, lineWidth: 1)
                                )
                            
                            VStack(alignment: .leading) {
                                Text(crewMember.astronaut.name)
                                    .foregroundColor(.white)
                                    .font(.headline)
                                
                                Text(crewMember.role)
                                    .foregroundColor(.secondary)
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
        }
    }
}


struct MissionViewScroll_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")
                    static let astronaults: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    static var previews: some View {
        MissionViewScroll(mission: missions[3], crew: [])
    }
}
