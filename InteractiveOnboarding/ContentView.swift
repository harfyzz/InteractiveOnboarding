//
//  ContentView.swift
//  InteractiveOnboarding
//
//  Created by Afeez Yunus on 04/03/2025.
//

import SwiftUI
import RiveRuntime

struct ContentView: View {
    var watch = RiveViewModel(fileName:"watchonboarding", stateMachineName:"Main")
    var stagess = RiveViewModel(fileName: "stagess", stateMachineName: "Main")
    @State var stage: Int = 1
    var body: some View {
        VStack {
            HStack{
                Image(systemName:stage == 1 ?  "xmark" : "arrow.left")
                    .foregroundStyle(.secondary)
                    .font(.subheadline)
                    .padding(.vertical, 12)
                    .padding(.horizontal, 16)
                    .background(Color.gray.opacity(0.2))
                    .clipShape(RoundedRectangle(cornerRadius: 32))
                    .onTapGesture {
                        let hapticFeedbackGenerator = UIImpactFeedbackGenerator(style: .light)
                        hapticFeedbackGenerator.impactOccurred()
                        if stage > 1 {
                            withAnimation(.spring(duration:0.3)){
                                stage -= 1
                            }
                        }
                    }
                Spacer()
                Text("Help")
                    .foregroundStyle(.secondary)
                    .font(.subheadline)
                    .padding(.vertical, 12)
                    .padding(.horizontal, 16)
                    .background(Color.gray.opacity(0.2))
                    .clipShape(RoundedRectangle(cornerRadius: 32))
            }
            Spacer()
                
            watch.view()
                    .frame(height: 500)
                    .onChange(of: stage) { oldValue, newValue in
                        watch.setInput( "Stage", value: Double(newValue))
                        stagess.setInput( "Stage", value: Double(newValue))
                    }
            /*
            stagess.view()
                .frame(height: 32)
                   .background(Color.gray.opacity(0.1))
                    .clipShape(RoundedRectangle(cornerRadius: 16)) */
            if stage == 1 {
                VStack(spacing:6){
                    Text("Welcome to Elite")
                        .font(.title2)
                        .fontWeight(.medium)
                    Text("First, let’s set up your device.")
                        .font(.subheadline)
                        .fontWeight(.medium)
                        .foregroundStyle(.secondary)
                        .padding(.bottom, 24)
                }
                .transition(.blurReplace())
            }
            else if stage == 2 {
                    
                    VStack(spacing:4){
                        Text("STEP 1")
                            .font(.system(size: 14, weight: .semibold, design: .monospaced) )
                            .foregroundStyle(Color("Dark Orange"))
                    Text("Charge your device")
                            .font(.title2)
                        .fontWeight(.medium)
                    Text("Connect the charger (provided in the box) to the port at the bottom of the device. You would see a green indicator when it is charging.")
                            .multilineTextAlignment(.center)
                            .font(.subheadline)
                        .fontWeight(.medium)
                        .foregroundStyle(.secondary)
                        .padding(.bottom, 24)
                        .padding(.horizontal,8)
                }
                    .transition(.blurReplace())
                        
                
           
            }
            else if stage == 3 {
                    
                    VStack(spacing:4){
                        Text("STEP 2")
                            .font(.system(size: 14, weight: .semibold, design: .monospaced) )
                            .foregroundStyle(Color("Dark Orange"))
                    Text("Open the clasp")
                            .font(.title2)
                        .fontWeight(.medium)
                    Text("Firmly lift the clasp from the bottom and pull using force to open it. Note the serial number, which you'll use later to pair your Elite.")
                            .multilineTextAlignment(.center)
                            .font(.subheadline)
                        .fontWeight(.medium)
                        .foregroundStyle(.secondary)
                        .padding(.bottom, 24)
                        .padding(.horizontal,8)
                }
                    .transition(.blurReplace())
                        
                
           
            }
            else if stage == 4 {
                    
                    VStack(spacing:4){
                        Text("STEP 3")
                            .font(.system(size: 14, weight: .semibold, design: .monospaced) )
                            .foregroundStyle(Color("Dark Orange"))
                    Text("Your Elite is ready to pair!")
                            .font(.title2)
                        .fontWeight(.medium)
                    Text("A Blue light would appear on the side of your Elite, which means that it is ready to pair. Make sure your phone’s bluetooth is enabled.")
                            .multilineTextAlignment(.center)
                            .font(.subheadline)
                        .fontWeight(.medium)
                        .foregroundStyle(.secondary)
                        .padding(.bottom, 24)
                        .padding(.horizontal,8)
                }
                    .transition(.blurReplace())
                        
                
           
            }
                VStack{
                    Text( stage > 1 ? "Continue" :"Get Started")
                        .foregroundStyle(.black.opacity(0.7))
                        .font(.subheadline)
                        .fontWeight(.medium)
                        .padding()
                        .frame(width:250)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 32))
                        .onTapGesture {
                            let hapticFeedbackGenerator = UIImpactFeedbackGenerator(style: .light)
                            hapticFeedbackGenerator.impactOccurred()
                            if stage != 4 {
                                withAnimation(.spring(duration:0.3)){
                                    stage += 1
                                }
                            }
                        }
                    if stage == 1 {
                        Text("No, I'm not ready")
                            .foregroundStyle(.white)
                            .font(.subheadline)
                            .fontWeight(.medium)
                            .padding()
                            .frame(width:250)
                            .background(Color.gray.opacity(0.2))
                            .clipShape(RoundedRectangle(cornerRadius: 32))
                    }
                }
            
          
            
           
        }
        .padding(.horizontal, 16)
        .preferredColorScheme(.dark)
        
    }
}

#Preview {
    ContentView()
}
