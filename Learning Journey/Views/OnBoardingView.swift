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
    @State private var selectedDuration: GoalDuration? = nil
    
    
    var body: some View {
        
        ZStack{
            Color.black
                .ignoresSafeArea()
            
            
            VStack(spacing: 25){
                
                FlameLogo()
                    .frame(width: 110, height: 110)
                    .padding(.top, 50)
                
                
                
                VStack (alignment: .leading, spacing: 20){
                    
                    
                    Text("Hello Learner")
                        .font(.system(size: 34))
                        .fontWeight(.bold)
                    
                    VStack (alignment: .leading, spacing: 20){
                        Text("This app will help you learn everday!")
                            .foregroundStyle(Color("brandLightGray"))
                            .font(.system(size: 17))
                        
                        
                        
                        Text("I want to learn").font(.system(size: 22))
                        TextField("Swift", text: $viewModel.currentGoal.goalName, prompt: Text("Swift...").foregroundColor(.gray))
                            .font(.system(size: 22))
                            .padding(12)
                            .background(Color.white.opacity(0.1))
                            .cornerRadius(10)                             .foregroundStyle(.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                            )
                        
                    }
                    
                    Text("I want to learn it in a").font(.system(size: 22))
                    HStack(spacing: 15){
                        Button(action: {
                            viewModel.currentGoal.goalDuration = .week
                            selectedDuration = .week
                        }
                               
                        ) { Text("Week")
                                .font(.system(size: 21))
                                .frame(maxWidth: .infinity)
                            
                        }
                        .controlSize(.large)
                        .buttonStyle(.bordered)
                        .buttonStyle(.borderedProminent)
                        .tint(selectedDuration == .week ? Color.orange.opacity(3) : Color.gray.opacity(0.5))
                        .glassEffect()
                        
                        Button (action: {
                            viewModel.currentGoal.goalDuration = .month
                            selectedDuration = .month
                            }
                        ) {
                            Text("Month")
                                .font(.system(size: 21))
                                .frame(maxWidth: .infinity)
                        }
                        .controlSize(.large)
                        .buttonStyle(.bordered)
                        .buttonStyle(.borderedProminent)
                        .tint(selectedDuration == .month ? Color.orange.opacity(3) : Color.gray.opacity(0.5))
                        .glassEffect()
                        
                        Button(action: {
                            viewModel.currentGoal.goalDuration = .year
                            selectedDuration = .year
                        }
                               
                        ) {
                            Text("Year")
                                .font(.system(size: 21))
                                .frame(maxWidth: .infinity)
                            
                        }
                        .controlSize(.large)
                        .buttonStyle(.bordered)
                        .buttonStyle(.borderedProminent)
                        .tint(selectedDuration == .year ? Color.orange.opacity(3) : Color.gray.opacity(0.5))
                        .glassEffect()
                        
                        
                        
                    }/* end of hstack */
                    Spacer()
                    
                    Button(action: {
                        isOnboardingComplete = true
                    }) {
                        Text("Start Learning")
                            .font(.system(size: 22))
                            .frame(maxWidth: .infinity)
                        
                    }
                    .controlSize(.extraLarge)
                    .buttonStyle(.bordered)
                    .buttonStyle(.borderedProminent)
                    .tint(selectedDuration != nil ? Color.orange.opacity(3) : Color.gray.opacity(0.5))
                    .glassEffect()
                    .padding(.bottom, 20)
                    
                    
                }
                .padding()
                .fullScreenCover(isPresented: $isOnboardingComplete) {
                    ActivityView()
                } //end of ztack
                .foregroundStyle(.white)
            }
        }
    }
    
    struct FlameLogo: View {
        var body: some View {
            ZStack {
                                Circle()
                    .fill(Color(red: 0.2, green: 0.1, blue: 0.05).opacity(0.4))
                                    .frame(width: 100, height: 100)
                                    .overlay(
                                        Circle()
                                            .stroke(Color.white, lineWidth: 1)
                                    )
                                
                                Image(systemName: "flame.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30, height: 40)
                                    .foregroundStyle(
                                        LinearGradient(gradient: Gradient(colors: [Color.orange, Color.red]),
                                                       startPoint: .topLeading,
                                                       endPoint: .bottomTrailing)
                                    )
                            }
                
                .shadow(color: Color.orange.opacity(0.18), radius: 10, x: 0, y: 6)
            }
        }

            
        
    }
    

    
    #Preview {
        OnBoardingView()
    }

