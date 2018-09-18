//
//  KRAlertIconPath.swift
//  KRAlertController
//
//  Copyright © 2016年 Krimpedance. All rights reserved.
//

import UIKit

/**
 *  KRAlertIconPath
 */
struct KRAlertIconPath {
   static func getPath(_ type: KRAlertControllerType, size: CGSize) -> CGPath {
      let path: UIBezierPath
      switch type {
      case .normal: path = UIBezierPath()
      case .success: path = success
      case .information: path = information
      case .warning: path = warning
      case .error: path = error
      case .edit: path = edit
      case .authorize: path = authorize
      }

      let defaultSize = CGSize(width: 200, height: 100)
      path.apply(CGAffineTransform(scaleX: size.width/defaultSize.width, y: size.height/defaultSize.height))

      return path.cgPath
   }
}

/**
 *  Paths --------
 */
extension KRAlertIconPath {
   static var success: UIBezierPath {
      let path = UIBezierPath()
      path.move(to: CGPoint(x: 86.822, y: 100))
      path.addLine(to: CGPoint(x: 37.596, y: 45.437))
      path.addLine(to: CGPoint(x: 47.095, y: 36.868))
      path.addLine(to: CGPoint(x: 86.377, y: 80.409))
      path.addLine(to: CGPoint(x: 152.526, y: 0))
      path.addLine(to: CGPoint(x: 162.404, y: 8.127))
      path.addLine(to: CGPoint(x: 86.822, y: 100))
      return path
   }

   static var information: UIBezierPath {
      let path = UIBezierPath()
      path.move(to: CGPoint(x: 109.804, y: 9.804))
      path.addCurve(to: CGPoint(x: 100, y: 19.608), controlPoint1: CGPoint(x: 109.804, y: 15.218), controlPoint2: CGPoint(x: 105.415, y: 19.608))
      path.addCurve(to: CGPoint(x: 90.196, y: 9.804), controlPoint1: CGPoint(x: 94.585, y: 19.608), controlPoint2: CGPoint(x: 90.196, y: 15.218))
      path.addCurve(to: CGPoint(x: 100, y: 0), controlPoint1: CGPoint(x: 90.196, y: 4.389), controlPoint2: CGPoint(x: 94.585, y: 0))
      path.addCurve(to: CGPoint(x: 109.804, y: 9.804), controlPoint1: CGPoint(x: 105.415, y: 0), controlPoint2: CGPoint(x: 109.804, y: 4.389))
      path.move(to: CGPoint(x: 107.843, y: 96.078))
      path.addLine(to: CGPoint(x: 107.843, y: 33.333))
      path.addLine(to: CGPoint(x: 84.314, y: 33.333))
      path.addLine(to: CGPoint(x: 84.314, y: 37.255))
      path.addLine(to: CGPoint(x: 92.157, y: 37.255))
      path.addLine(to: CGPoint(x: 92.157, y: 96.078))
      path.addLine(to: CGPoint(x: 84.314, y: 96.078))
      path.addLine(to: CGPoint(x: 84.314, y: 100))
      path.addLine(to: CGPoint(x: 115.686, y: 100))
      path.addLine(to: CGPoint(x: 115.686, y: 96.078))
      path.addLine(to: CGPoint(x: 107.843, y: 96.078))
      return path
   }

   static var warning: UIBezierPath {
      let path = UIBezierPath()
      path.move(to: CGPoint(x: 98.889, y: 66.667))
      path.addCurve(to: CGPoint(x: 98.027, y: 63.802), controlPoint1: CGPoint(x: 98.889, y: 66.667), controlPoint2: CGPoint(x: 98.575, y: 65.625))
      path.addCurve(to: CGPoint(x: 97.107, y: 60.514), controlPoint1: CGPoint(x: 97.751, y: 62.891), controlPoint2: CGPoint(x: 97.442, y: 61.784))
      path.addCurve(to: CGPoint(x: 95.978, y: 56.25), controlPoint1: CGPoint(x: 96.774, y: 59.245), controlPoint2: CGPoint(x: 96.355, y: 57.813))
      path.addCurve(to: CGPoint(x: 93.436, y: 45.573), controlPoint1: CGPoint(x: 95.21, y: 53.125), controlPoint2: CGPoint(x: 94.299, y: 49.479))
      path.addCurve(to: CGPoint(x: 91.111, y: 33.333), controlPoint1: CGPoint(x: 92.574, y: 41.667), controlPoint2: CGPoint(x: 91.809, y: 37.5))
      path.addCurve(to: CGPoint(x: 89.575, y: 27.116), controlPoint1: CGPoint(x: 90.758, y: 31.25), controlPoint2: CGPoint(x: 90.174, y: 29.167))
      path.addCurve(to: CGPoint(x: 88.423, y: 21.094), controlPoint1: CGPoint(x: 88.984, y: 25.065), controlPoint2: CGPoint(x: 88.472, y: 23.047))
      path.addCurve(to: CGPoint(x: 89.212, y: 15.462), controlPoint1: CGPoint(x: 88.376, y: 19.141), controlPoint2: CGPoint(x: 88.68, y: 17.253))
      path.addCurve(to: CGPoint(x: 91.078, y: 10.417), controlPoint1: CGPoint(x: 89.692, y: 13.672), controlPoint2: CGPoint(x: 90.333, y: 11.979))
      path.addCurve(to: CGPoint(x: 93.489, y: 6.152), controlPoint1: CGPoint(x: 91.794, y: 8.854), controlPoint2: CGPoint(x: 92.644, y: 7.422))
      path.addCurve(to: CGPoint(x: 96.016, y: 2.865), controlPoint1: CGPoint(x: 94.304, y: 4.883), controlPoint2: CGPoint(x: 95.238, y: 3.776))
      path.addCurve(to: CGPoint(x: 98.053, y: 0.749), controlPoint1: CGPoint(x: 96.805, y: 1.953), controlPoint2: CGPoint(x: 97.506, y: 1.237))
      path.addCurve(to: CGPoint(x: 98.889, y: 0), controlPoint1: CGPoint(x: 98.598, y: 0.26), controlPoint2: CGPoint(x: 98.889, y: 0))
      path.addLine(to: CGPoint(x: 101.111, y: 0))
      path.addCurve(to: CGPoint(x: 101.947, y: 0.749), controlPoint1: CGPoint(x: 101.111, y: 0), controlPoint2: CGPoint(x: 101.402, y: 0.26))
      path.addCurve(to: CGPoint(x: 103.984, y: 2.865), controlPoint1: CGPoint(x: 102.494, y: 1.237), controlPoint2: CGPoint(x: 103.195, y: 1.953))
      path.addCurve(to: CGPoint(x: 106.511, y: 6.152), controlPoint1: CGPoint(x: 104.762, y: 3.776), controlPoint2: CGPoint(x: 105.696, y: 4.883))
      path.addCurve(to: CGPoint(x: 108.922, y: 10.417), controlPoint1: CGPoint(x: 107.356, y: 7.422), controlPoint2: CGPoint(x: 108.206, y: 8.854))
      path.addCurve(to: CGPoint(x: 110.788, y: 15.462), controlPoint1: CGPoint(x: 109.667, y: 11.979), controlPoint2: CGPoint(x: 110.308, y: 13.672))
      path.addCurve(to: CGPoint(x: 111.577, y: 21.094), controlPoint1: CGPoint(x: 111.32, y: 17.253), controlPoint2: CGPoint(x: 111.624, y: 19.141))
      path.addCurve(to: CGPoint(x: 110.425, y: 27.116), controlPoint1: CGPoint(x: 111.528, y: 23.047), controlPoint2: CGPoint(x: 111.016, y: 25.065))
      path.addCurve(to: CGPoint(x: 108.889, y: 33.333), controlPoint1: CGPoint(x: 109.826, y: 29.167), controlPoint2: CGPoint(x: 109.242, y: 31.25))
      path.addCurve(to: CGPoint(x: 106.564, y: 45.573), controlPoint1: CGPoint(x: 108.191, y: 37.5), controlPoint2: CGPoint(x: 107.426, y: 41.667))
      path.addCurve(to: CGPoint(x: 104.022, y: 56.25), controlPoint1: CGPoint(x: 105.701, y: 49.479), controlPoint2: CGPoint(x: 104.79, y: 53.125))
      path.addCurve(to: CGPoint(x: 102.893, y: 60.514), controlPoint1: CGPoint(x: 103.645, y: 57.813), controlPoint2: CGPoint(x: 103.226, y: 59.245))
      path.addCurve(to: CGPoint(x: 101.973, y: 63.802), controlPoint1: CGPoint(x: 102.558, y: 61.784), controlPoint2: CGPoint(x: 102.249, y: 62.891))
      path.addCurve(to: CGPoint(x: 101.111, y: 66.667), controlPoint1: CGPoint(x: 101.424, y: 65.625), controlPoint2: CGPoint(x: 101.111, y: 66.667))
      path.addLine(to: CGPoint(x: 98.889, y: 66.667))
      path.move(to: CGPoint(x: 110.714, y: 89.286))
      path.addCurve(to: CGPoint(x: 100, y: 100), controlPoint1: CGPoint(x: 110.714, y: 95.203), controlPoint2: CGPoint(x: 105.917, y: 100))
      path.addCurve(to: CGPoint(x: 89.286, y: 89.286), controlPoint1: CGPoint(x: 94.083, y: 100), controlPoint2: CGPoint(x: 89.286, y: 95.203))
      path.addCurve(to: CGPoint(x: 100, y: 78.571), controlPoint1: CGPoint(x: 89.286, y: 83.368), controlPoint2: CGPoint(x: 94.083, y: 78.571))
      path.addCurve(to: CGPoint(x: 110.714, y: 89.286), controlPoint1: CGPoint(x: 105.917, y: 78.571), controlPoint2: CGPoint(x: 110.714, y: 83.368))
      return path
   }

   static var error: UIBezierPath {
      let path = UIBezierPath()
      path.move(to: CGPoint(x: 150, y: 15.021))
      path.addLine(to: CGPoint(x: 134.979, y: 0))
      path.addLine(to: CGPoint(x: 100, y: 34.979))
      path.addLine(to: CGPoint(x: 65.021, y: 0))
      path.addLine(to: CGPoint(x: 50, y: 15.021))
      path.addLine(to: CGPoint(x: 84.979, y: 50))
      path.addLine(to: CGPoint(x: 50, y: 84.979))
      path.addLine(to: CGPoint(x: 65.021, y: 100))
      path.addLine(to: CGPoint(x: 100, y: 65.021))
      path.addLine(to: CGPoint(x: 134.979, y: 100))
      path.addLine(to: CGPoint(x: 150, y: 84.979))
      path.addLine(to: CGPoint(x: 115.021, y: 50))
      path.addLine(to: CGPoint(x: 150, y: 15.021))
      return path
   }

   static var edit: UIBezierPath {
      let path = UIBezierPath()
      path.move(to: CGPoint(x: 147.86, y: 22.823))
      path.addLine(to: CGPoint(x: 137.516, y: 33.165))
      path.addLine(to: CGPoint(x: 116.834, y: 12.483))
      path.addLine(to: CGPoint(x: 127.178, y: 2.141))
      path.addCurve(to: CGPoint(x: 132.346, y: -0.001), controlPoint1: CGPoint(x: 128.557, y: 0.756), controlPoint2: CGPoint(x: 130.392, y: -0.001))
      path.addCurve(to: CGPoint(x: 137.52, y: 2.141), controlPoint1: CGPoint(x: 134.299, y: -0.001), controlPoint2: CGPoint(x: 136.137, y: 0.763))
      path.addLine(to: CGPoint(x: 147.861, y: 12.483))
      path.addCurve(to: CGPoint(x: 150, y: 17.653), controlPoint1: CGPoint(x: 149.243, y: 13.861), controlPoint2: CGPoint(x: 150, y: 15.697))
      path.addCurve(to: CGPoint(x: 147.86, y: 22.823), controlPoint1: CGPoint(x: 149.999, y: 19.603), controlPoint2: CGPoint(x: 149.239, y: 21.445))
      path.move(to: CGPoint(x: 85.083, y: 85.598))
      path.addCurve(to: CGPoint(x: 77.892, y: 90.547), controlPoint1: CGPoint(x: 84.255, y: 86.383), controlPoint2: CGPoint(x: 81.391, y: 88.319))
      path.addLine(to: CGPoint(x: 58.946, y: 71.6))
      path.addCurve(to: CGPoint(x: 64.384, y: 64.929), controlPoint1: CGPoint(x: 60.888, y: 68.936), controlPoint2: CGPoint(x: 63.052, y: 66.258))
      path.addLine(to: CGPoint(x: 111.664, y: 17.653))
      path.addLine(to: CGPoint(x: 132.346, y: 38.335))
      path.addLine(to: CGPoint(x: 85.083, y: 85.598))
      path.move(to: CGPoint(x: 50, y: 100.001))
      path.addLine(to: CGPoint(x: 54.749, y: 79.02))
      path.addCurve(to: CGPoint(x: 54.895, y: 78.113), controlPoint1: CGPoint(x: 54.816, y: 78.72), controlPoint2: CGPoint(x: 54.867, y: 78.413))
      path.addCurve(to: CGPoint(x: 54.966, y: 77.963), controlPoint1: CGPoint(x: 54.91, y: 78.07), controlPoint2: CGPoint(x: 54.949, y: 78.006))
      path.addLine(to: CGPoint(x: 71.503, y: 94.503))
      path.addCurve(to: CGPoint(x: 69.846, y: 95.503), controlPoint1: CGPoint(x: 70.95, y: 94.838), controlPoint2: CGPoint(x: 70.392, y: 95.174))
      path.addLine(to: CGPoint(x: 50, y: 100.001))
      return path
   }

   static var authorize: UIBezierPath {
      let path = UIBezierPath()
      path.move(to: CGPoint(x: 104.701, y: 86.517))
      path.addLine(to: CGPoint(x: 93.535, y: 86.517))
      path.addLine(to: CGPoint(x: 96.379, y: 71.054))
      path.addCurve(to: CGPoint(x: 93.535, y: 66.294), controlPoint1: CGPoint(x: 94.707, y: 70.086), controlPoint2: CGPoint(x: 93.535, y: 68.354))
      path.addCurve(to: CGPoint(x: 99.117, y: 60.704), controlPoint1: CGPoint(x: 93.535, y: 63.206), controlPoint2: CGPoint(x: 96.037, y: 60.704))
      path.addCurve(to: CGPoint(x: 104.701, y: 66.294), controlPoint1: CGPoint(x: 102.199, y: 60.704), controlPoint2: CGPoint(x: 104.701, y: 63.206))
      path.addCurve(to: CGPoint(x: 101.856, y: 71.054), controlPoint1: CGPoint(x: 104.701, y: 68.354), controlPoint2: CGPoint(x: 103.528, y: 70.086))
      path.addLine(to: CGPoint(x: 104.701, y: 86.517))
      path.addLine(to: CGPoint(x: 104.701, y: 100))
      path.addLine(to: CGPoint(x: 137.077, y: 100))
      path.addLine(to: CGPoint(x: 137.077, y: 39.329))
      path.addLine(to: CGPoint(x: 83.147, y: 39.329))
      path.addLine(to: CGPoint(x: 83.147, y: 29.914))
      path.addCurve(to: CGPoint(x: 100, y: 13.483), controlPoint1: CGPoint(x: 83.147, y: 21.007), controlPoint2: CGPoint(x: 90.862, y: 13.483))
      path.addCurve(to: CGPoint(x: 116.853, y: 29.914), controlPoint1: CGPoint(x: 109.138, y: 13.483), controlPoint2: CGPoint(x: 116.853, y: 21.007))
      path.addLine(to: CGPoint(x: 116.853, y: 39.329))
      path.addLine(to: CGPoint(x: 130.336, y: 39.329))
      path.addLine(to: CGPoint(x: 130.336, y: 29.914))
      path.addCurve(to: CGPoint(x: 100, y: 0), controlPoint1: CGPoint(x: 130.336, y: 13.416), controlPoint2: CGPoint(x: 116.734, y: 0))
      path.addCurve(to: CGPoint(x: 69.664, y: 29.914), controlPoint1: CGPoint(x: 83.278, y: 0), controlPoint2: CGPoint(x: 69.664, y: 13.416))
      path.addLine(to: CGPoint(x: 69.664, y: 39.329))
      path.addLine(to: CGPoint(x: 62.923, y: 39.329))
      path.addLine(to: CGPoint(x: 62.923, y: 100))
      path.addLine(to: CGPoint(x: 104.701, y: 100))
      path.addLine(to: CGPoint(x: 104.701, y: 86.517))
      return path
   }
}
