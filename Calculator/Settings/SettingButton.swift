import UIKit

@IBDesignable
class SettingButton: UIButton {
    @IBInspectable var roundButton: Bool = false {
        didSet {
            if roundButton {
                layer.cornerRadius = frame.height / 2
            }
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        set { layer.borderWidth = newValue }
        get { return layer.borderWidth }
    }
    
    @IBInspectable var borderColor: UIColor? {
        set { if let color = newValue {
            layer.borderColor = color.cgColor
        } else {
            layer.borderColor = nil
            }
        }
        get { if let color = layer.borderColor {
            return UIColor(cgColor: color)
            }
            return nil
        }
    }
    
    override func prepareForInterfaceBuilder() {
        if roundButton {
            layer.cornerRadius = frame.height / 2
        }
    }
    
}
