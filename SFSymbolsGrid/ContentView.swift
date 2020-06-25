// https://github.com/m760622/SFSymbolsGrid
//  ContentView.swift
//  SFSymbolsGrid
// m7606225@gmail.com
//  Created by Mohammed Abunada on 2020-06-25.
// https://github.com/m760622

import SwiftUI

private var colors: [Color] = [.red, .blue, .black, .gray, .green, .yellow, .orange, .pink, .purple]

struct ContentView: View {
    @State private var sliderValue: CGFloat = 2
    var body: some View {
        let columns: [GridItem] = Array(repeating: .init(.flexible()), count: Int(self.sliderValue))
        return NavigationView{
            VStack{
                HStack{
                    Slider(value: $sliderValue, in: 2...5, step: 1)
                        .padding()
                    Text( String(format: "%g", self.sliderValue))
                        .font(.largeTitle)
                        .foregroundColor(colors.randomElement())
                        .padding()
                }//HStack
                ScrollView{
                    LazyVGrid(columns: columns){
                        ForEach(sfSymbols, id: \.self){item in
                            NavigationLink(destination: aqsaImageRow(imageName: item, detailView: true) )
                            {
                                aqsaImageRow(imageName: item, detailView: false)
                            }//NavigationLink
                        }
                    }
                }//ScrollView
            }//VStack
            .navigationBarTitle(Text("SF Symbols Grid in SwiftUI 2") , displayMode: .inline)
        }//NavigationView
    }//body
}//ContentView


struct aqsaImageRow: View {
    var imageName: String
    var detailView: Bool
    var body: some View {
        VStack {
            if detailView{
                Text(imageName)
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                    .foregroundColor(colors.randomElement())
                    .padding(.all, 10 )
            }
            Image(systemName: imageName)
                .resizable(capInsets: EdgeInsets(), resizingMode: .stretch)
                .frame(width: detailView ? 150 : 50, height: detailView ? 150 : 50, alignment: .center)
                .foregroundColor(colors.randomElement())
                .padding(.all, 10)
            
        }//HStack
    }//body
}//aqsaImageRow



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
