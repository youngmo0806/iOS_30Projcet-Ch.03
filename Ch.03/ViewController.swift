//
//  ViewController.swift
//  Ch.03
//
//  Created by hklife_mo on 2021/09/14.
//

import UIKit

enum Operation {
    case Add
    case Subtract
    case Divide
    case Multiply
    case unknown
}

class ViewController: UIViewController {

    @IBOutlet weak var numberOutputLabel: UILabel! //디스 플레이 판넬
    var firstItem = ""      //계산할 첫번째 수
    var secondItem = ""     //계산할 두번째 수
    var currentInput = ""   //현재 입력된값
    var result = ""         //결과값
    var currentOperation: Operation = .unknown
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func tapAcButton(_ sender: UIButton) {
        //모든 항목 초기화
        self.firstItem = ""
        self.secondItem = ""
        self.currentInput = ""
        self.result = ""
        self.currentOperation = .unknown
        self.numberOutputLabel.text = "0"

    }
    
    @IBAction func tapNumberButton(_ sender: UIButton) {
        guard let number = sender.title(for: .normal) else { return } //버튼의 타이틀을 읽어온다.
        
        if self.currentInput.count < 9 { // 패털에 9자리 까지만 입력 받는다.
            self.currentInput += number
            self.numberOutputLabel.text = self.currentInput
        }
    }
    
    @IBAction func tapEqualButton(_ sender: UIButton) {
        self.operand(self.currentOperation) //현재 저장되어 있는 상태
    }
    
    @IBAction func tapDotButton(_ sender: UIButton) {
        //현재 입력값 8개 이하이고, . 이 없으면
        if self.currentInput.count < 8 && !self.currentInput.contains(".") {
            self.currentInput += self.currentInput.isEmpty ? "0." : "."
            self.numberOutputLabel.text = self.currentInput
        }
    }

    @IBAction func tapDivideButton(_ sender: UIButton) {
        self.operand(.Divide)
    }
    
    @IBAction func tapMultiplyButton(_ sender: UIButton) {
        self.operand(.Multiply)
    }
    
    @IBAction func tapSubtractButton(_ sender: UIButton) {
        self.operand(.Subtract)
    }
    
    @IBAction func tapAddButton(_ sender: UIButton) {
        self.operand(.Add)
    }
    
    private func operand(_ operand: Operation) {
        //연산 기능
        
        if self.currentOperation != .unknown {  //연산 수행
            if !self.currentInput.isEmpty {
                self.secondItem = self.currentInput
                self.currentInput = ""
                
                guard let first = Double(self.firstItem) else { return }
                guard let second = Double(self.secondItem) else { return }
                
                switch self.currentOperation {
                    case .Add:
                        self.result = "\(first + second)"
                    case .Divide:
                        self.result = "\(first / second)"
                    case .Multiply:
                        self.result = "\(first * second)"
                    case .Subtract:
                        self.result = "\(first - second)"
                    default:
                        break
                }
                
                if let result = Double(self.result), result.truncatingRemainder(dividingBy: 1) == 0 {
                    self.result = "\(Int(result))"
                }
                
                self.firstItem = self.result
                self.numberOutputLabel.text = self.result
            }
            self.currentOperation = operand
            
        } else { //.unknown 일때
            self.firstItem = self.currentInput
            self.currentInput = ""
            self.currentOperation = operand
        }
        
        
    }
}

