//
//  BMICalculatorManager.swift
//  BMI
//
//  Created by 혜리 on 2022/11/14.
//

import UIKit

struct BMICalculatorManager {
    
    // BMI 계산 결과값 보관을 위한 변수
    private var bmi: BMI?
    
    // BMI 얻기 메서드
    mutating func getBMI(height: String, weight: String) -> BMI {
        // BMI 만들기 메서드 호출
        calculateBMI(height: height, weight: weight)
        // BMI 리턴
        return bmi ?? BMI(value: 0.0, matchColor: UIColor.white, advice: "문제발생")
    }
    
    // BMI 만들기 메서드(BMI 수치 계산해서, BMI 구조체 인스턴스 만드는 메서드)
    mutating private func calculateBMI(height: String, weight: String) {
        guard let h = Double(height), let w = Double(weight) else {
            bmi = BMI (value: 0.0, matchColor: UIColor.white, advice: "문제발생")
            return
        }
        
        var bmiNum = w / (h * h) * 10000
        bmiNum = round(bmiNum * 10) / 10
        
        switch bmiNum {
        case ..<18.6:
            let color = UIColor(displayP3Red: 22/255, green: 231/255, blue: 207/255, alpha: 1)
            bmi = BMI(value: bmiNum, matchColor: color, advice: "저체중")
        case 18.6..<23.0:
            let color = UIColor(displayP3Red: 212/255, green: 251/255, blue: 121/255, alpha: 1)
            bmi = BMI(value: bmiNum, matchColor: color, advice: "표준체중")
        case 23.0..<25.0:
            let color = UIColor(displayP3Red: 218/255, green: 127/255, blue: 163/255, alpha: 1)
            bmi = BMI(value: bmiNum, matchColor: color, advice: "과체중")
        case 25.0..<30.0:
            let color = UIColor(displayP3Red: 255/255, green: 150/255, blue: 141/255, alpha: 1)
            bmi = BMI(value: bmiNum, matchColor: color, advice: "중도비만")
        case 30.0...:
            let color = UIColor(displayP3Red: 255/255, green: 100/255, blue: 78/255, alpha: 1)
            bmi = BMI(value: bmiNum, matchColor: color, advice: "과도비만")
        default:
            let color = UIColor.black
            bmi = BMI(value: bmiNum, matchColor: color, advice: "문제발생")
        }
    }
    
    
    
    
    
    
    // BMI 계산 메서드
//    mutating func calculateBMI(height: String, weight: String) {
//        guard let h = Double(height), let w = Double(weight) else {
//            bmi = 0.0
//            return
//        }
//        var bmiNumber = w / (h * h) * 10000
////        print("BMI 결과값 (반올림 하기 전): \(bmi)")
//        bmi = round(bmiNumber * 10) / 10    // 반올림 해주는 코드
////        print("BMI 결과값 (반올림 후): \(bmi)")
//    }
//
//    // BMI 계산된 결과값
//    func getBMIResult() -> BMI {
//        return bmi ?? BMI(value: 0.0, matchColor: UIColor.white, advice: "문제발생")
//    }
//
//    // 색깔 얻는 메서드
//    func getBackgroundColor() -> UIColor {
//        guard let bmi = bmi else { return UIColor.black }
//        switch bmi {
//        case ..<18.6:
//            return UIColor(displayP3Red: 22/255, green: 231/255, blue: 207/255, alpha: 1)
//        case 18.6..<23.0:
//            return UIColor(displayP3Red: 212/255, green: 251/255, blue: 121/255, alpha: 1)
//        case 23.0..<25.0:
//            return UIColor(displayP3Red: 218/255, green: 127/255, blue: 163/255, alpha: 1)
//        case 25.0..<30.0:
//            return UIColor(displayP3Red: 255/255, green: 150/255, blue: 141/255, alpha: 1)
//        case 30.0...:
//            return UIColor(displayP3Red: 255/255, green: 100/255, blue: 78/255, alpha: 1)
//        default:
//            return UIColor.black
//        }
//    }
//
//    // 문자열 얻는 메서드
//    func getBMIAdviceString() -> String {
//        guard let bmi = bmi else { return "" }
//        switch bmi {
//        case ..<18.6:
//            return "저체중"
//        case 18.6..<23.0:
//            return "표준체중"
//        case 23.0..<25.0:
//            return "과체중"
//        case 25.0..<30.0:
//            return "중도비만"
//        case 30.0...:
//            return "고도비만"
//        default:
//            return ""
//        }
//    }
}
