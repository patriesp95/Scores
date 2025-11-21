//
//  AddScoreViewModel.swift
//  Scores
//
//  Created by Patricia M Espert on 21/11/25.
//


import SwiftUI
import PhotosUI
import Combine

final class AddScoreViewModel: ObservableObject {
    // MARK: - Form Fields
    @Published var title: String = ""
    @Published var selectedComposer: String = ""
    @Published var year: Int = 2024
    @Published var length: Double = 0.0
    @Published var tracks: [String] = [""]

    // MARK: - Image Management
    @Published var selectedPhotoItem: PhotosPickerItem?
    @Published var coverImage: UIImage?
    @Published var coverImageName: String = ""

    // MARK: - Validation
    @Published var showValidationAlert = false
    @Published var validationMessage = ""

    // MARK: - Computed Properties
    var hasValidTracks: Bool {
        !tracks.filter { !$0.trimmingCharacters(in: .whitespaces).isEmpty }.isEmpty
    }

    // MARK: - Track Management
    func addTrack() {
        tracks.append("")
    }

    func removeTrack(at index: Int) {
        guard tracks.count > 1, tracks.indices.contains(index) else { return }
        tracks.remove(at: index)
    }

    // MARK: - Image Loading
    func loadImage() async {
        guard let selectedPhotoItem else { return }

        do {
            if let data = try await selectedPhotoItem.loadTransferable(type: Data.self),
               let originalImage = UIImage(data: data) {
                let thumbnailSize = CGSize(width: 512, height: 512)
                if let thumbnail = originalImage.preparingThumbnail(of: thumbnailSize) {
                    self.coverImage = thumbnail
                    self.coverImageName = generateCoverImageName()
                }
            }
        } catch {
            print("Error loading image: \(error)")
        }
    }

    private func generateCoverImageName() -> String {
        "cover_\(UUID().uuidString)"
    }

    // MARK: - Validation
    func validate() -> Bool {
        var isValid = true
        var errors: [String] = []

        // Validar título
        if title.trimmingCharacters(in: .whitespaces).isEmpty {
            errors.append("El título no puede estar vacío")
            isValid = false
        }

        // Validar compositor
        if selectedComposer.isEmpty {
            errors.append("Debe seleccionar un compositor")
            isValid = false
        }

        // Validar año
        if year < 1900 || year > 2100 {
            errors.append("El año debe estar entre 1900 y 2100")
            isValid = false
        }

        // Validar duración
        if length <= 0 {
            errors.append("La duración debe ser mayor que 0")
            isValid = false
        }

        // Validar tracks
        let validTracks = tracks.filter { !$0.trimmingCharacters(in: .whitespaces).isEmpty }
        if validTracks.isEmpty {
            errors.append("Debe haber al menos un track válido")
            isValid = false
        }

        if !isValid {
            validationMessage = errors.joined(separator: "\n")
            showValidationAlert = true
        }

        return isValid
    }

    // MARK: - Score Creation
    func createScore(withID newID: Int) -> Score? {
        guard validate() else { return nil }

        let validTracks = tracks.filter { !$0.trimmingCharacters(in: .whitespaces).isEmpty }

        return Score(
            id: newID,
            title: title.trimmingCharacters(in: .whitespaces),
            composer: selectedComposer,
            year: year,
            length: length,
            cover: coverImageName.isEmpty ? "placeholder" : coverImageName,
            tracks: validTracks
        )
    }

    // MARK: - Reset
    func reset() {
        title = ""
        selectedComposer = ""
        year = 2024
        length = 0.0
        tracks = [""]
        selectedPhotoItem = nil
        coverImage = nil
        coverImageName = ""
        showValidationAlert = false
        validationMessage = ""
    }
}
