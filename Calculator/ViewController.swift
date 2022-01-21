import UIKit

class ViewController: UIViewController {
    
    //MARK: - Outlets and Variables
    @IBOutlet weak var outputLabel: UILabel!
    private var calculation = Calculation()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        outputLabel.text = "0"
    }
    
    //MARK: - Methods
    private func operation(operation: Operation) {
        if calculation.currentOperation != .Null {
            if calculation.runningNumber != "" {
                calculation.rightValue = calculation.runningNumber
                calculation.runningNumber = ""
                
                switch calculation.currentOperation {
                case .Add:
                    calculation.result = "\(Double(calculation.leftValue)! + Double(calculation.rightValue)!)"
                case .Subtract:
                    calculation.result = "\(Double(calculation.leftValue)! - Double(calculation.rightValue)!)"
                case .Multiple:
                    calculation.result = "\(Double(calculation.leftValue)! * Double(calculation.rightValue)!)"
                case .Devide:
                    calculation.result = "\(Double(calculation.leftValue)! / Double(calculation.rightValue)!)"
                default: break
                }
                calculation.leftValue = calculation.result
                if (Double(calculation.result)!.truncatingRemainder(dividingBy: 1) == 0) {
                    calculation.result = "\(Int(Double(calculation.result)!))"
                }
                outputLabel.text = calculation.result
            }
            calculation.currentOperation = operation
            
        } else {
            calculation.leftValue = calculation.runningNumber
            calculation.runningNumber = ""
            calculation.currentOperation = operation
        }
    }
    
    //MARK: - Actions
    @IBAction func numberPressed(_ sender: SettingButton) {
        if calculation.runningNumber.count <= 8  {
            calculation.runningNumber += "\(sender.tag)"
            outputLabel.text = calculation.runningNumber
        }
    }
    @IBAction func allClearPressed(_ sender: SettingButton) {
        calculation.runningNumber = ""
        calculation.leftValue = ""
        calculation.rightValue = ""
        calculation.result = ""
        calculation.currentOperation = .Null
        outputLabel.text = "0"
    }
    @IBAction func dotPressed(_ sender: SettingButton) {
        if calculation.runningNumber.count <= 7 {
            calculation.runningNumber += "."
            outputLabel.text = calculation.runningNumber
        }
    }
    @IBAction func equalPressed(_ sender: SettingButton) {
        operation(operation: calculation.currentOperation)
    }
    @IBAction func addPressed(_ sender: SettingButton) {
        operation(operation: .Add)
    }
    @IBAction func subtractPressed(_ sender: SettingButton) {
        operation(operation: .Subtract)
    }
    @IBAction func multiplePressed(_ sender: SettingButton) {
        operation(operation: .Multiple)
    }
    @IBAction func dividePressed(_ sender: SettingButton) {
        operation(operation: .Devide)
    }
}
