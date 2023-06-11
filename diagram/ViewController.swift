//
//  ViewController.swift
//  diagram
//
//  Created by Daniel Kulchenko on 08/06/2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var chartView: UIView!
    @IBOutlet weak var firstStackView: UIStackView!
    @IBOutlet weak var firstStackViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var secondStackView: UIStackView!
    @IBOutlet weak var secondStackViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var firstGreenHeight: NSLayoutConstraint!
    @IBOutlet weak var firstYellowHeight: NSLayoutConstraint!
    @IBOutlet weak var firstRedHeight: NSLayoutConstraint!
    @IBOutlet weak var secondGreenHeight: NSLayoutConstraint!
    @IBOutlet weak var secondYellowHeight: NSLayoutConstraint!
    @IBOutlet weak var secondRedHeight: NSLayoutConstraint!
    
    @IBOutlet weak var firstGreenTextField: UITextField!
    @IBOutlet weak var firstYellowTextField: UITextField!
    @IBOutlet weak var firstRedTextField: UITextField!
    
    @IBOutlet weak var secondGreenTextField: UITextField!
    @IBOutlet weak var secondYellowTextField: UITextField!
    @IBOutlet weak var secondRedTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateChart(firstGreen: 10, firstYellow: 10, firstRed: 10, secondGreen: 10, secondYellow: 10, secondRed: 10)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let firstGreen = getIntValue(from: firstGreenTextField)
        let firstYellow = getIntValue(from: firstYellowTextField)
        let firstRed = getIntValue(from: firstRedTextField)
        
        let secondGreen = getIntValue(from: secondGreenTextField)
        let secondYellow = getIntValue(from: secondYellowTextField)
        let secondRed = getIntValue(from: secondRedTextField)
        
        let firstHours = firstGreen + firstYellow + firstRed
        let secondHours = secondGreen + secondYellow + secondRed
        
        let minHours = min(firstHours, secondHours)
        let maxHours = max(firstHours, secondHours)
        
        let value = chartView.frame.height - (CGFloat(minHours) / CGFloat(maxHours) * chartView.frame.height)
        
        firstStackViewTopConstraint.constant = value
        secondStackViewTopConstraint.constant = value
    }
    
    
    func updateChart(firstGreen: Int, firstYellow: Int, firstRed: Int, secondGreen: Int, secondYellow: Int, secondRed: Int) {
        
        let totalHeight = firstStackView.frame.height
        let g = CGFloat(firstGreen)
        let y = CGFloat(firstYellow)
        let r = CGFloat(firstRed)
        let sum = g + y + r
        
        let newGreenHeight = g/sum*totalHeight
        let newYellowHeight = y/sum*totalHeight
        let newRedHeight = r/sum*totalHeight
        firstGreenHeight.constant = newGreenHeight
        firstYellowHeight.constant = newYellowHeight
        firstRedHeight.constant = newRedHeight
        
        let secondTotalHeight = secondStackView.frame.height
        let secondGreen = CGFloat(secondGreen)
        let secondYellow = CGFloat(secondYellow)
        let secondRed = CGFloat(secondRed)
        let secondSum = secondGreen + secondYellow + secondRed
        
        let newSecondGreenHeight = secondGreen / secondSum * secondTotalHeight
        let newSecondYellowHeight = secondYellow / secondSum * secondTotalHeight
        let newSecondRedHeight = secondRed / secondSum * secondTotalHeight

        secondGreenHeight.constant = newSecondGreenHeight
        secondYellowHeight.constant = newSecondYellowHeight
        secondRedHeight.constant = newSecondRedHeight
    }
    
    private func getIntValue(from textField: UITextField) -> Int {
        return Int(textField.text ?? "") ?? 0
    }
    
    @IBAction func updateAction(_ sender: Any) {
        let firstGreen = getIntValue(from: firstGreenTextField)
        let firstYellow = getIntValue(from: firstYellowTextField)
        let firstRed = getIntValue(from: firstRedTextField)
        
        let secondGreen = getIntValue(from: secondGreenTextField)
        let secondYellow = getIntValue(from: secondYellowTextField)
        let secondRed = getIntValue(from: secondRedTextField)
        
        updateChart(firstGreen: firstGreen,
                    firstYellow: firstYellow,
                    firstRed: firstRed,
                    secondGreen: secondGreen,
                    secondYellow: secondYellow,
                    secondRed: secondRed)
    }
}

