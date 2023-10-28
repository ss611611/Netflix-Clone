//
//  Extensions.swift
//  Netflix-Clone
//
//  Created by Jackie Lu on 2023/10/28.
//

import Foundation

extension String {
    func capitalizeFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
