/*
 * Copyright 2016 Workday, Inc.
 *
 * This software is available under the MIT license.
 * Please see the LICENSE.txt file in this project.
 */

import Foundation

/// Action that defines a shadow to apply to all future draw actions
final public class DrawShadow : DrawAction {

    fileprivate let color: UIColor
    fileprivate let blur: CGFloat
    fileprivate let offset: CGSize
    
    /**
     Initializes a DrawShadow
     
     - parameter color: Tho color to use for the shadow
     - parameter blur: The blur radius to apply to the shadow
     - parameter offset: CGSize defining the width and height offset to apply to the shadow when rendering
     */
    public init(color: UIColor, blur: CGFloat, offset: CGSize) {
        self.color = color
        self.blur = blur
        self.offset = offset
    }

    override func performActionInContext(_ context: DrawContext) {
        context.performGraphicsActions { gContext in
            gContext.setShadow(offset: offset, blur: blur, color: color.cgColor)
            next?.performActionInContext(context)
        }
    }
}
