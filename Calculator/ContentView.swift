//
//  ContentView.swift
//  Calculator
//
//  Created by Amanjot singh Gill on 2022-07-13.
//Student id-A00246495
//

import SwiftUI
enum DispButtons: String {
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case addition = "+"
    case subtraction = "-"
    case multiplication = "*"
    case dividation = "/"
    case equalTo = "="
    case zero = "0"
    case clear = "Clear"
      // setting the colors for bottons
    var buttonColor: Color{
        switch self {
        case .addition, .subtraction, .multiplication, .dividation, .equalTo:
            return.orange
        
        case .clear:
            return.black
        default:
            return Color.gray
        }
    }
}


struct ContentView: View {
    
    
    // array for the values of buttons
    let buttons: [[DispButtons]]=[
        
        [.seven, .eight, .nine, .multiplication],
        [ .four, .five, .six, .subtraction],
        [.three, .two, .one, .addition],
        [ .clear, .zero, .dividation, .equalTo],
    ]
    var body: some View {
        ZStack{
            Color.white.edgesIgnoringSafeArea(.all)
            VStack{
                
                // text display
                HStack{
                    Spacer()
                    Text("0")
                        .bold()
                        .font(.system(size: 45))
                        .foregroundColor(.black)
                }
                
            //  Setting buttons
                ForEach (buttons, id: \.self) {row in
                    HStack (spacing: 12){
                        ForEach(row, id: \.self) { item in
                            Button(action: {
                                
                                
                            }, label: {
                                Text(item.rawValue)
                                    .frame(
                                        width: 70, height: 70)
                                    .font(.system(size: 28))
                                    .foregroundColor(.white)
                                    .background(item.buttonColor)
                                    .cornerRadius(35)
                        })
                    }
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
}
