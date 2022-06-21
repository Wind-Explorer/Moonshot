//
//  MissionView.swift
//  Moonshot
//
//  Created by Adam Chen JingFan on 2022/6/13.
//

import SwiftUI

struct MissionView: View {
    let mission: Mission
    let crew: [CrewMember]
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: geometry.size.width * 0.6)
                        .padding()
                    
                    Text(mission.displayName)
                        .font(.title.bold())
                        .foregroundColor(.white)
                    
                    Text("Date: \(mission.formattedLaunchDate)")
                        .font(.headline)
                        .foregroundColor(.white.opacity(1))
                    
                    VStack(alignment: .leading) {
                        Rectangle()
                            .frame(height: 4)
                            .foregroundColor(.lightBackground)
                            .padding(.vertical)
                        
                        Text("Mission Highlights")
                            .font(.title.bold())
                            .padding(.bottom, 5)
                        
                        Text(mission.description)
                        
                        Rectangle()
                            .frame(height: 4)
                            .foregroundColor(.lightBackground)
                            .padding(.vertical)
                        
                        Text("Crews")
                            .font(.title.bold())
                            .padding(.bottom, 5)
                    }
                    .padding(.horizontal)
                    
                    MissionViewScroll(mission: mission, crew: crew)
                }
                .padding(.bottom)
            }
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
    
    init(mission: Mission, astronauts: [String: Astronaut]) {
        self.mission = mission
        
        self.crew = mission.crew.map { member in
            if let astronaut = astronauts[member.name] {
                return CrewMember(role: member.role, astronaut: astronaut)
            } else {
                fatalError("Missing \(member.name)")
            }
        }
    }
}

struct MissionView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")
                    static let astronaults: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        MissionView(mission: missions[3], astronauts: astronaults)
            .preferredColorScheme(.dark)
    }
}
