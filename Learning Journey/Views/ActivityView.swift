//
//  ActivityView.swift
//  Learning Journey
//
//  Created by Tala Aldhahri on 05/05/1447 AH.
//

import SwiftUI

struct ActivityView: View {
    var body: some View {
        ZStack{
            Color.black
                .ignoresSafeArea()
        
            VStack{
                HStack {
                    Text("Activity")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Spacer()
                    
                    Button(action: {}) {
                        Image(systemName: "calendar")
                    }
                    Button(action: {}) {
                        Image(systemName: "person.crop.circle")
                    }
                    
                }
                .padding()
                HStack {
                    Text("October 2025")
                        .fontWeight(.bold)
                    Button(action: { /* Open full calendar */ }) {
                        HStack {
                            Image(systemName: "chevron.right") .foregroundStyle( Color("brandOrange") )
                        }
                    }
                    
                    Spacer()
                    Button(action: { /* Go to previous week/month */ }) {
                        Image(systemName: "chevron.left") .foregroundStyle( Color("brandOrange") )
                    }
                    
                    // 4. The ">" (next) button
                    Button(action: { /* Go to next week/month */ }) {
                        Image(systemName: "chevron.right") .foregroundStyle( Color("brandOrange") )
                    }
                }
                .padding()
                
                Spacer()
            } //end of zstack
            .foregroundStyle(.white)
        }
    }
}

#Preview {
    ActivityView()
}
