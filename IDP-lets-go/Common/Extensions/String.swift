//
//  String.swift
//  IDP-lets-go
//
//  Created by Laura Corssac on 26.12.24.
//

import SwiftUI

extension String {
    
    func heightForWidth(_ width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(
            with: constraintRect,
            options: .usesLineFragmentOrigin,
            attributes: [.font: font],
            context: nil
        )
        return ceil(boundingBox.height)
    }
}
