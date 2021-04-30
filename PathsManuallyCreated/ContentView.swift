//
//  ContentView.swift
//  Perimeter
//
//  Created by ronnie on 4/17/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        ZStack {
            
            MakeGradient()
            
            TransparentWindows()
                .fill(Color.gray)
                .border(Color.red, width: 4)
            
        }.edgesIgnoringSafeArea(.all)
    }
}
 
struct MakeGradient: View {
    @State private var movePoints = false
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [Color.red, Color.white, Color.red]),
                       startPoint: .bottom,
                       endPoint: movePoints ? .topLeading : .topTrailing)
            .animation(Animation
                        .easeInOut(duration: 2)
                        .delay(0.5)
                        .repeatForever(autoreverses: true))
            .onAppear() {
                self.movePoints.toggle()
        }
    }
}

struct TransparentWindows: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            // screen perimeter
            path.move(to: CGPoint(x: rect.minX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
            path.closeSubpath()
            
            // top left rectangle
            path.move(to: CGPoint(x: rect.midX/4, y: rect.midY/2))
            path.addLine(to: CGPoint(x: rect.midX/4, y: rect.midY*0.75))
            path.addLine(to: CGPoint(x: rect.midX/2, y: rect.midY*0.75))
            path.addLine(to: CGPoint(x: rect.midX/2, y: rect.midY/2))
            path.closeSubpath()
            
            // middle left rectangle
            path.move(to: CGPoint(x: rect.midX/4, y: rect.midY))
            path.addLine(to: CGPoint(x: rect.midX/4, y: rect.midY*1.25))
            path.addLine(to: CGPoint(x: rect.midX/2, y: rect.midY*1.25))
            path.addLine(to: CGPoint(x: rect.midX/2, y: rect.midY))
            path.closeSubpath()
            
            // bottom left rectangle
            path.move(to: CGPoint(x: rect.midX/4, y: rect.maxY*0.75))
            path.addLine(to: CGPoint(x: rect.midX/4, y: rect.maxY*0.9))
            path.addLine(to: CGPoint(x: rect.midX/2, y: rect.maxY*0.9))
            path.addLine(to: CGPoint(x: rect.midX/2, y: rect.maxY*0.75))
            path.closeSubpath()
            
            // right rectangle
            path.move(to: CGPoint(x: rect.midX, y: rect.midY/2))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY*0.9))
            path.addLine(to: CGPoint(x: rect.midX*1.5, y: rect.maxY*0.9))
            path.addLine(to: CGPoint(x: rect.midX*1.5, y: rect.midY/2))
            path.closeSubpath()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
