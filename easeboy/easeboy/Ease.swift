
import UIKit

class Ease {
    
    static var Linear: UICubicTimingParameters {
        get {
            return getParameters(0, 0, 0, 0)
        }
    }
    
    /// -------------
    /// IN
    /// -------------
    
    static var InSine: UICubicTimingParameters {
        get {
            return getParameters(0.47, 0, 0.745, 0.715)
        }
    }
    
    static var InCubic: UICubicTimingParameters {
        get {
            return getParameters(0.55, 0.055, 0.675, 0.19)
        }
    }
    
    static var InQuint: UICubicTimingParameters {
        get {
            return getParameters(0.755, 0.05, 0.855, 0.06)
        }
    }

    static var InCirc: UICubicTimingParameters {
        get {
            return getParameters(0.6, 0.04, 0.98, 0.335)
        }
    }
    
    static var InQuad: UICubicTimingParameters {
        get {
            return getParameters(0.55, 0.085, 0.68, 0.53)
        }
    }
    
    static var InQuart: UICubicTimingParameters {
        get {
            return getParameters(0.895, 0.03, 0.685, 0.22)
        }
    }
    
    static var InExpo: UICubicTimingParameters {
        get {
            return getParameters(0.95, 0.05, 0.795, 0.035)
        }
    }
    
    static var InBack: UICubicTimingParameters {
        get {
            return getParameters(0.6, -0.28, 0.735, 0.045)
        }
    }
    
    /// -------------
    /// OUT
    /// -------------
    
    static var OutSine: UICubicTimingParameters {
        get {
            return getParameters(0.39, 0.575, 0.565, 1)
        }
    }
    
    static var OutCubic: UICubicTimingParameters {
        get {
            return getParameters(0.215, 0.61, 0.355, 1)
        }
    }
    
    static var OutQuint: UICubicTimingParameters {
        get {
            return getParameters(0.23, 1, 0.32, 1)
        }
    }
    
    static var OutCirc: UICubicTimingParameters {
        get {
            return getParameters(0.075, 0.82, 0.165, 1)
        }
    }
    
    static var OutQuad: UICubicTimingParameters {
        get {
            return getParameters(0.25, 0.46, 0.45, 0.94)
        }
    }
    
    static var OutQuart: UICubicTimingParameters {
        get {
            return getParameters(0.165, 0.84, 0.44, 1)
        }
    }
    
    static var OutExpo: UICubicTimingParameters {
        get {
            return getParameters(0.19, 1, 0.22, 1)
        }
    }
    
    static var OutBack: UICubicTimingParameters {
        get {
            return getParameters(0.175, 0.885, 0.32, 1.275)
        }
    }
    
    /// -------------
    /// IN OUT
    /// -------------
    
    static var InOutSine: UICubicTimingParameters {
        get {
            return getParameters(0.445, 0.05, 0.55, 0.95)
        }
    }
    
    static var InOutCubic: UICubicTimingParameters {
        get {
            return getParameters(0.645, 0.045, 0.355, 1)
        }
    }
    
    static var InOutQuint: UICubicTimingParameters {
        get {
            return getParameters(0.86, 0, 0.07, 1)
        }
    }
    
    static var InOutCirc: UICubicTimingParameters {
        get {
            return getParameters(0.785, 0.135, 0.15, 0.86)
        }
    }
    
    static var InOutQuad: UICubicTimingParameters {
        get {
            return getParameters(0.455, 0.03, 0.515, 0.955)
        }
    }
    
    static var InOutQuart: UICubicTimingParameters {
        get {
            return getParameters(0.77, 0, 0.175, 1)
        }
    }
    
    static var InOutExpo: UICubicTimingParameters {
        get {
            return getParameters(1, 0, 0, 1)
        }
    }
    
    static var InOutBack: UICubicTimingParameters {
        get {
            return getParameters(0.68, -0.55, 0.265, 1.55)
        }
    }
    
    ///
    
    static func  GetAll() -> [UICubicTimingParameters] {
        let array:[UICubicTimingParameters] = [
            Ease.InSine, Ease.InCubic, Ease.InQuint, Ease.InCirc, Ease.InQuad, Ease.InQuart, Ease.InExpo, Ease.InBack,
            Ease.OutSine, Ease.OutCubic, Ease.OutQuint, Ease.OutCirc, Ease.OutQuad, Ease.OutQuart, Ease.OutExpo, Ease.OutBack,
            Ease.InOutSine, Ease.InOutCubic, Ease.InOutQuint, Ease.InOutCirc, Ease.InOutQuad, Ease.InOutQuart, Ease.InOutExpo, Ease.InBack,
            Ease.Linear
        ]
        return array
    }
    
    static func  GetNames() -> [String] {
        let array:[String] = [
            "IN_SINE", "IN_CUBIC", "IN_QUINT", "IN_CIRC", "IN_QUAD", "IN_QUART", "IN_EXPO", "IN_BACK",
            "OUT_SINE", "OUT_CUBIC", "OUT_QUINT", "OUT_CIRC", "OUT_QUAD", "OUT_QUART", "OUT_EXPO", "OUT_BACK",
            "INOUT_SINE", "INOUT_CUBIC", "INOUT_QUINT", "INOUT_CIRC", "INOUT_QUAD", "INOUT_QUART", "INOUT_EXPO", "INOUT_BACK",
            "LINEAR"
        ]
        return array
    }
    
    
    static func getParameters(_ ax:CGFloat, _ ay:CGFloat, _ bx:CGFloat, _ by:CGFloat) -> UICubicTimingParameters{
        return UICubicTimingParameters(controlPoint1: CGPoint(x: ax, y: ay), controlPoint2: CGPoint(x: bx, y: by))
    }
    
}
