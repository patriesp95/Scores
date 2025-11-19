//
//  EditScoreVM.swift
//  Scores
//
//  Created by Patricia M Espert on 19/11/25.
//

import Combine
import SwiftUI

final class EditScoreVM: ObservableObject {

    let score: Score

    @Published var title = ""
    @Published var composer = ""
    @Published var year = 0
    @Published var length = 0.0
    @Published var cover = ""
    @Published var tracks: [String] = []

    init(score: Score) {
        self.score = score
        initData()
    }

    func initData() {
        title = score.title
        composer = score.composer
        year = score.year
        length = score.length
        cover = score.cover
        tracks = score.tracks
    }

}
