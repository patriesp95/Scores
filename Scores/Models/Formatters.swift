//
//  Formatters.swift
//  Scores
//
//  Created by Patricia M Espert on 12/11/25.
//

import Foundation

extension Score {
    var yearS: String {
        year.formatted(.number.precision(.significantDigits(4)))
    }
    
    var lengthS: String {
        "\(length.formatted(.number.precision(.integerAndFractionLength(integer: 3, fraction: 1)))) min."
    }
}
