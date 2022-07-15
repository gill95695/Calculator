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
    case clear = "A/C"
    case cube = "x^3"
    case square = "x^2"
    
    case log = "log"
    
    case mod = "%"
      // setting the colors for bottons
    var buttonColor: Color{
        switch self {
        case .addition, .subtraction, .multiplication, .dividation, .equalTo,
                .cube, .square, .log, .mod:
            return.orange
        
        case .clear:
            return.black
        default:
            return Color.gray
        }
    }
}

enum Operations {
   case addition, subtraction, multiplication, dividation, mod , square, cube, log , none
}

struct ContentView: View {
    @State var value = "0"
    @State var curtOperation: Operations = .none
    @ State var runningnum = 0
    
    
    // array for the values of buttons
    let buttons: [[DispButtons]]=[
        
        [.seven, .eight, .nine, .multiplication],
        [ .four, .five, .six, .subtraction],
        [.three, .two, .one, .addition],
        [ .clear, .zero, .dividation, .equalTo],
        [ .log, .square, .cube , .mod]
    ]
    var body: some View {
        ZStack{
            Spacer()
            Color.white.edgesIgnoringSafeArea(.all)
            VStack{
                Spacer()
                // text display
                HStack{
                    Spacer()
                    Text(value)
                        .bold()
                        .font(.system(size: 45))
                        .foregroundColor(.black)
                }
                
            //  buttons
                ForEach (buttons, id: \.self) {row in
                    HStack (spacing: 10){
                        ForEach(row, id: \.self) { item in
                            Button(action: {
                                self.didTap(button: item)
                                
                            }, label: {
                                Text(item.rawValue)
                                    .frame(
                                        width: 60, height: 60)
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
    // making buttons perform task
     func didTap (button: DispButtons){
         switch button {
         case .addition, .subtraction, .dividation, .multiplication,.mod, .square, .cube,  .log, .equalTo:
             if button == .addition {
                 self.curtOperation = .addition
                 self.runningnum = Int (self.value) ?? 0
             }else if button == .subtraction {
                 self.curtOperation = .subtraction
                 self.runningnum = Int (self.value) ?? 0
             }else if button == .multiplication{
                 self.curtOperation = .multiplication
                 self.runningnum = Int (self.value) ?? 0
             }else if button == .dividation {
                 self.curtOperation = .dividation
                 self.runningnum = Int (self.value) ?? 0
             }else if button == .mod{
                 self.curtOperation = .mod
                 self.runningnum = Int (self.value) ?? 0
             }else if button == .square {
                 self.curtOperation = .square
                 self.runningnum = Int (self.value) ?? 0
             }else if button == .cube {
                 self.curtOperation = .cube
                 self.runningnum = Int (self.value) ?? 0
             }else if button == .log {
                 self.curtOperation = .log
                 self.runningnum = Int (self.value) ?? 0
             }
             // functionality for equal button
             else if button == .equalTo {
                 let runningnum = self.runningnum
                 let curtvalue = Int(self.value) ?? 0
                 switch self.curtOperation {
                 case .addition:
                     self.value = "\(runningnum + curtvalue)"
                 case .subtraction:
                     self.value = "\(runningnum - curtvalue)"
                 case .multiplication:
                     self.value = "\(runningnum * curtvalue)"
                 case .dividation:
                     self.value = "\(runningnum / curtvalue)"
                 case .mod:
                     self.value = "\(runningnum % curtvalue)"
                 case .square :
                     self.value = "\(pow( Decimal(curtvalue), 2))"
                 case .cube:
                     self.value = "\(pow( Decimal(curtvalue), 3))"
                 
                 case .log:
                     self.value = "\(log(Double(curtvalue)))"
                
                 case .none:
                     break
                     }
             }
             if button != .equalTo && button != .cube && button != .square && button != .log {
                 self.value = "0"
             }
         case .clear:
             self.value = "0"
             
         default:
             let num = button.rawValue
             if self.value == "0"{
                 value = num
             }
             else {
                 self.value = "\(self.value)\(num)"
             }
         }
             
         
     }
    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
}
