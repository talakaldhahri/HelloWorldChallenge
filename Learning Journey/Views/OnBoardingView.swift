//
//  OnBoardingView.swift
//  Learning Journey
//
//  Created by Tala Aldhahri on 05/05/1447 AH.
//

import SwiftUI

struct OnBoardingView: View {
    //we use state to make our own temporary copy of a struct
    @StateObject var viewModel = LearningViewModel()
    @State var isOnboardingComplete: Bool = false
    
    var body: some View {
        
        ZStack{
            Color.black
                .ignoresSafeArea()
            
            
            VStack{
                
                GlassAvatar()
                    .frame(width: 110, height: 110)
                    .padding(.top, 28)
                
                VStack(alignment: .center){
                
                    Image("flame")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                        .padding()
                        
                    
                }
                
                VStack (alignment: .leading){
                    
                    
                    Spacer()
                    
                    Text("Hello Learner")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        
                    
                    Text("This app will help you learn everday!")
                        .foregroundStyle(Color("brandLightGray"))
                    
                    Text("I want to learn")
                    TextField("Swift", text: $viewModel.currentGoal.goalName)
                    
                    Text("I want to learn it in a")
                    HStack{
                        Button(action: {
                            viewModel.currentGoal.goalDuration = .week
                        }
                        ) { Text("Week")
                                .background(viewModel.currentGoal.goalDuration == .week ? Color("brandOrange") : Color("brandGray"))
                                
                        }
                        Button (action: {
                            viewModel.currentGoal.goalDuration = .month
                        }) {
                            Text("Month")
                                .background(viewModel.currentGoal.goalDuration == .month ? Color("brandOrange") : Color("brandGray"))
                        }
                        Button(action: {
                            viewModel.currentGoal.goalDuration = .year
                        }
                        ) {
                            Text("Year")
                                .background(viewModel.currentGoal.goalDuration == .year ? Color(" brandOrange") : Color("brandGray"))
                        }
                    }/* end of hstack */
                    Spacer()
                    
                    Button(action: {
                        isOnboardingComplete = true
                    }) {
                        Text("Start Learning")
                    }
                    .frame(maxWidth: .infinity)
                    
                }
                .padding()
            } //end of ztack
            .foregroundStyle(.white)
        }
    }
}

struct GlassAvatar: View {
    var body: some View {
        ZStack {
            // Outer subtle glow
            Circle()
                .fill(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.161, green: 0.071, blue: 0.0, alpha: 1)), Color.clear]), startPoint: .top, endPoint: .bottom))
                .blur(radius: 12)

            // Frosted circle with subtle border and inner highlight
            GlassShape(cornerRadius: 999) {
                Image(systemName: "flame.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 36, height: 36)
                    .foregroundStyle(
                        LinearGradient(gradient: Gradient(colors: [Color.orange, Color.red]),
                                       startPoint: .topLeading,
                                       endPoint: .bottomTrailing)
                    )
            }
            .shadow(color: Color.orange.opacity(0.18), radius: 10, x: 0, y: 6)
        }
    }
    struct GlassShape<Content: View>: View {
        var cornerRadius: CGFloat
        @ViewBuilder var content: Content

        init(cornerRadius: CGFloat = 20, @ViewBuilder content: () -> Content) {
            self.cornerRadius = cornerRadius
            self.content = content()
        }

        var body: some View {
            ZStack {
                RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                    .fill(
                        LinearGradient(gradient: Gradient(stops: [
                            .init(color: Color.white.opacity(0.06), location: 0),
                            .init(color: Color.white.opacity(0.02), location: 1)
                        ]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing)
                    )
                    .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: cornerRadius))
                    .overlay(
                        RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                            .stroke(LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.25), Color.white.opacity(0.03)]),
                                                   startPoint: .top,
                                                   endPoint: .bottom),
                                    lineWidth: 1)
                            .blendMode(.overlay)
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                            .fill(LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.06), Color.clear]),
                                                 startPoint: .topLeading,
                                                 endPoint: .center))
                            .mask(RoundedRectangle(cornerRadius: cornerRadius).padding(2))
                    )

                content
            }
        }
    }
}



#Preview {
    OnBoardingView()
}
