//
//  ViewController.swift
//  diagram
//
//  Created by Daniel Kulchenko on 08/06/2023.
//

import UIKit

class ViewController: UIViewController {
    
	// remove stack views top constraints
	//	"bar" stack views will be constrained to the bottom of the chart view
	//	when values are entered, we'll set the heights of the bar "segments" (the arrangedSubviews)
	//	relative to the chart view height
	//	so they will "grow from the bottom"
	
    @IBOutlet weak var chartView: UIView!
    @IBOutlet weak var firstStackView: UIStackView!
    @IBOutlet weak var secondStackView: UIStackView!
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
    
    func updateChart(firstGreen: Int, firstYellow: Int, firstRed: Int, secondGreen: Int, secondYellow: Int, secondRed: Int) {
        
		let fg = CGFloat(firstGreen)
		let fy = CGFloat(firstYellow)
		let fr = CGFloat(firstRed)
		let firstSum = fg + fy + fr
		
		let sg = CGFloat(secondGreen)
		let sy = CGFloat(secondYellow)
		let sr = CGFloat(secondRed)
		let secondSum = sg + sy + sr
		
		// get the MAX of the two sums
		let maxSum: CGFloat = max(firstSum, secondSum)

		// get the height of the "chartView" -- NOT the height of the stack views
        let chartHeight = chartView.frame.height
        
		// calculate each segment "value"
		//	as a percentage of the Max Sum
		// then set each segment Height
		//	as a percentage of the Chart View height
		
		// example...
		//	first  values: 10 20 30	... firstSum  = 60
		//	second values: 10 10 10	... secondSum = 30
		//	maxSum = 60
		//	first segment heights:
		//		10 / 60 * chartHeight
		//		20 / 60 * chartHeight
		//		30 / 60 * chartHeight
		//	second segment heights:
		//		10 / 60 * chartHeight
		//		10 / 60 * chartHeight
		//		10 / 60 * chartHeight
		
        let newGreenHeight = fg / maxSum * chartHeight
        let newYellowHeight = fy / maxSum * chartHeight
        let newRedHeight = fr / maxSum * chartHeight
        firstGreenHeight.constant = newGreenHeight
        firstYellowHeight.constant = newYellowHeight
        firstRedHeight.constant = newRedHeight
        
        let newSecondGreenHeight = sg / maxSum * chartHeight
        let newSecondYellowHeight = sy / maxSum * chartHeight
        let newSecondRedHeight = sr / maxSum * chartHeight
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

