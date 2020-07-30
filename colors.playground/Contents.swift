import UIKit

extension UIColor {
    convenience init(hex: Int, alpha: CGFloat = 1) {
        let red = CGFloat((hex & 0xFF0000) >> 16) / 255
        let green = CGFloat((hex & 0x00FF00) >> 8) / 255
        let blue = CGFloat(hex & 0x0000FF) / 255
        
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}

private enum Color {
    static let black = UIColor(hex: 0x222222)
    
    case red
    case green
    case blue
    
    var light: UIColor {
        switch self {
        case .red: return UIColor(hex: 0xe53935)
        case .green: return UIColor(hex: 0x4caf50)
        case .blue: return UIColor(hex: 0x2196f3)
        }
    }
    
    var dark: UIColor {
        switch self {
        case .red: return UIColor(hex: 0xf44336)
        case .green: return UIColor(hex: 0x81c784)
        case .blue: return UIColor(hex: 0x64b5f6)
        }
    }
}

public enum DynamicColor {
    case red
    case green
    case blue
    
    var uiColor: UIColor {
        switch self {
        case .red: return getDynamic(.red)
        case .green: return getDynamic(.green)
        case .blue: return getDynamic(.blue)
        }
    }
    
    private func getDynamic(_ color: Color) -> UIColor {
        if #available(iOS 13.0, *) {
            return UIColor { (trait) -> UIColor in
                return trait.userInterfaceStyle == .dark ? color.dark : color.light
            }
        } else {
            return color.light
        }
    }
}
