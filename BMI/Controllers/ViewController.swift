//
//  ViewController.swift
//  BMI
//
//  Created by 혜리 on 2022/11/11.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var calculateButton: UIButton!
    
    var bmiManager = BMICalculatorManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        heightTextField.delegate = self
        weightTextField.delegate = self
        configureUI()
    }
    
    func configureUI() {
        
        mainLabel.text = "키와 몸무게를 입력해 주세요."
        
        calculateButton.clipsToBounds = true
        calculateButton.layer.cornerRadius = 5
        calculateButton.setTitle("BMI 계산하기", for: .normal)
        
        heightTextField.placeholder = "cm 단위로 입력해 주세요."
        weightTextField.placeholder = "kg 단위로 입력해 주세요."
    }
    
    // BMI 계산하기 - 버튼 누르면 (다음 화면)
    @IBAction func calculateButtonTapped(_ sender: Any) {
        print(#function)
    }
    
    // 다음 화면으로 넘어가기 전
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if heightTextField.text == "" || weightTextField.text == "" {
            mainLabel.text = "키와 몸무게를 입력하셔야 합니다."
            mainLabel.textColor = .red
            return false
        }
        mainLabel.text = "키와 몸무게를 입력해 주세요."
        mainLabel.textColor = UIColor.black
        return true
    }
    
    // 다음 화면으로 넘어가기 전에 준비 (일반적으로 데이터 전달)
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print(#function)
        // 식별자 확인
        if segue.identifier == "toSecondVC" {
            let secondVC = segue.destination as! SecondViewController
            
            // 계산된 결과값을 다음 화면으로 전달
//            secondVC.bmiNumber = bmiManager.getBMIResult()
//            secondVC.bmiColor = bmiManager.getBackgroundColor()
//            secondVC.adviceString = bmiManager.getBMIAdviceString()
            secondVC.bmi = bmiManager.getBMI(height: heightTextField.text!, weight: weightTextField.text!)
        }
         
        // 다음 화면으로 가기 전에 텍스트 필드 비우기
        heightTextField.text = ""
        weightTextField.text = ""
    }
}


extension ViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        // 숫자만 입력이 허용되는 코드
        if Int(string) != nil || string == "" {     // 숫자로 변환이 된다면 / string이 빈 문자열 이라면
            return true    // 글자 입력을 허용
        }
        return false       // 글자 입력 허용하지 않음
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // 두 개의 텍스트 필드를 모두 종료 (키보드 내려가게)
        if heightTextField.text != "", weightTextField.text != "" {
            weightTextField.resignFirstResponder()
            return true
            // 두 번째 텍스트 필드로 넘어가도록
        } else if heightTextField.text != "" {
            weightTextField.becomeFirstResponder()
            return true
        }
        return false
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // 유저의 터치가 일어나면 두 개의 텍스트 필드를 키보드가 내려감
        heightTextField.resignFirstResponder()
        weightTextField.resignFirstResponder()
    }
}
