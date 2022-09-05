//
//  ContentView.swift
//  FizzBuzz Game
//
//  Created by Пользователь on 07/07/2022.
//  Copyright © 2022 Пользователь. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var score = 0
    @State var checkedNumber = Int.random(in: 1...100)
    
    //MARK: - View update and scoring methods
    func generateNumber() {
        checkedNumber = Int.random(in: 1...100)
    }
    
    func plusOne() {
        score += 1
        generateNumber()
    }
    
    func minusOne()  {
        score -= 1
        generateNumber()
    }
    
    //MARK: - Checking user answer methods
    func skipCheck() {
        if !checkedNumber.isMultiple(of: 3) && !checkedNumber.isMultiple(of: 5) {
            plusOne()
        } else {
            minusOne()
        }
    }
    
    func fizzCheck() {
        if checkedNumber.isMultiple(of: 3) {
            plusOne()
        } else {
            minusOne()
        }
    }
    
    func buzzCheck() {
        if checkedNumber.isMultiple(of: 5) {
            plusOne()
        } else {
            minusOne()
        }
    } 
    
    //MARK: - View Model
    var body: some View {
        VStack{
            ZStack{
                RoundedRectangle(cornerRadius: 40)
                    .frame(width: 200, height: 200)
                    .foregroundColor(.gray)
                Text("\(checkedNumber)")
                    .font(.system(size: 120, weight: .bold))
            }
            
            Text("Score: \(score)")
            .font(.system(size: 60))
            
            Button(action: {self.skipCheck()}) {
                Text("Skip")
                .frame(width: 160, height: 80)
                    .background(Color.red)
                    .font(.system(size: 40, weight: .bold))
                    .foregroundColor(.white)
                .clipShape(Capsule())
            }
            
            HStack {
                Button(action: {self.fizzCheck()}) {
                    Text("x 3")
                    .frame(width: 160, height: 80)
                        .background(Color.blue)
                        .font(.system(size: 40, weight: .bold))
                        .foregroundColor(.white)
                    .clipShape(Capsule())
                }
                
                Button(action: {self.buzzCheck()}) {
                    Text("x 5")
                    .frame(width: 160, height: 80)
                        .background(Color.green)
                        .font(.system(size: 40, weight: .bold))
                        .foregroundColor(.white)
                    .clipShape(Capsule())
                }
            }
            
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
