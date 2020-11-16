//
//  ContentView.swift
//  CalcSur
//
//  Created by s b on 16.11.2020.
//

import SwiftUI

struct ContentView: View {
    @State private var firstNumber = 0
    @State private var secondNumber = 0
    @State private var operand = ""
    @State private var calculatorText = "0"
    @State private var isTypingNumber = false
    private func createCalcDigit(_ number: String) -> Button<Text> {
        return Button(action: {
            self.digitTapped(number)
        }) {
            (Text(number))
        }
    }
    private func digitTapped(_ number: String) -> Void {
        if isTypingNumber {
            calculatorText += number
        } else {
            calculatorText = number
            isTypingNumber = true
        }
    }
    private func operandTapped(_ operand: String) {
        isTypingNumber = false
        firstNumber = Int(calculatorText)!
        self.operand = operand
        calculatorText = operand
    }
    private func calculate() {
        isTypingNumber = false
        var result  = 0
        secondNumber = Int(calculatorText)!
        if operand == "+" {
            result = firstNumber + secondNumber
        } else if operand == "-" {
            result = firstNumber - secondNumber
        }
        else if operand == "*" {
            result = firstNumber * secondNumber
        }
        else if operand == "/" {
            if secondNumber == 0 {
                result = 0
            } else
                {
                result = firstNumber / secondNumber
            }
        }
        calculatorText = "\(result)"
    }
    var body: some View {
        VStack {
            TextField("0", text: $calculatorText)
                .border(Color.gray, width: 1)
                .multilineTextAlignment(.trailing)
                .frame(maxWidth:100)
            HStack {
                // 2.
                createCalcDigit("1")
                createCalcDigit("2")
                createCalcDigit("3")
            }
            HStack {
                createCalcDigit("4")
                createCalcDigit("5")
                createCalcDigit("6")
            }
            HStack {
                createCalcDigit("7")
                createCalcDigit("8")
                createCalcDigit("9")
            }
            HStack {
                
                createCalcDigit("0")
                Button(action: {
                    self.operandTapped("+")
                }) {
                    (Text("+"))
                }
                Button(action: {
                    self.operandTapped("*")
                }) {
                    (Text("*"))
                }
            }
            HStack {
                Button(action: {
                    self.operandTapped("/")
                }) {
                    (Text("/"))
                }
                Button(action: {
                    self.operandTapped("-")
                }) {
                    (Text("-"))
                }
                Button(action: {
                    self.calculate()
                }) {
                    (Text("="))
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
