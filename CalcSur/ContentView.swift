//
//  ContentView.swift
//  CalcSur
//
//  Created by s b on 16.11.2020.
//

import SwiftUI

struct ContentView: View {
    @State private var firstNumber = 0.0
    @State private var secondNumber = 0.0
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
        firstNumber = Double(calculatorText)!
        self.operand = operand
        calculatorText = operand
    }
    private func calculate() {
        isTypingNumber = false
        var result  = 0.0
        secondNumber = Double(calculatorText)!
        if operand == "+" {
            result = firstNumber + secondNumber
        } else if operand == "-" {
            result = firstNumber - secondNumber
        }
        else if operand == "*" {
            result = firstNumber * secondNumber
        }
        else if operand == "/" {
            result = firstNumber / secondNumber
        }
        calculatorText = String(format: "%.3f", result)
    }
    var body: some View {
        VStack {
            TextField("0", text: $calculatorText)
                .border(Color.gray, width: 1)
                .multilineTextAlignment(.trailing)
                .frame(maxWidth:125)
            HStack {
                // 2.
                createCalcDigit("1").frame(minWidth: 24, maxWidth: 25)
                createCalcDigit("2").frame(minWidth: 24, maxWidth: 25)
                createCalcDigit("3").frame(minWidth: 24, maxWidth: 25)
                Button(action: {
                    self.operandTapped("+")
                }) {
                    (Text("+"))
                }.frame(minWidth: 24, maxWidth: 25)
                .foregroundColor(.orange)
            }
            HStack {
                createCalcDigit("4").frame(minWidth: 24, maxWidth: 25)
                createCalcDigit("5").frame(minWidth: 24, maxWidth: 25)
                createCalcDigit("6").frame(minWidth: 24, maxWidth: 25)
                Button(action: {
                    self.operandTapped("*")
                }) {
                    (Text("*"))
                }.frame(minWidth: 24, maxWidth: 25)
                .foregroundColor(.orange)
            }
            HStack {
                createCalcDigit("7").frame(minWidth: 24, maxWidth: 25)
                createCalcDigit("8").frame(minWidth: 24, maxWidth: 25)
                createCalcDigit("9").frame(minWidth: 24, maxWidth: 25)
                Button(action: {
                    self.operandTapped("-")
                }) {
                    (Text("-"))
                }.frame(minWidth: 24, maxWidth: 25)
                .foregroundColor(.orange)
            }
            HStack {
                createCalcDigit("0").frame(minWidth: 24, maxWidth: 25)
                createCalcDigit(".").frame(minWidth: 24, maxWidth: 25)
                Button(action: {
                    self.operandTapped("/")
                }) {
                    (Text("/"))
                }.frame(minWidth: 24, maxWidth: 25)
                .foregroundColor(.orange)
                Button(action: {
                    self.calculate()
                }) {
                    (Text("="))
                }.frame(minWidth: 24, maxWidth: 25)
                .foregroundColor(.orange)
            }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
