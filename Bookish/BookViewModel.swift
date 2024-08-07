import Foundation
import SwiftUI

class BookViewModel: ObservableObject {
    @Published var books: [Book] = []
    @AppStorage("isDevMode") var isDevMode: Bool = true

    init() {
        loadBooks()
    }

    func loadBooks() {
        if isDevMode {
            books = [
                Book(title: "Pride and Prejudice", author: "Jane Austen", filePath: Bundle.main.path(forResource: "pride_and_prejudice", ofType: "epub") ?? ""),
                Book(title: "The Adventures of Sherlock Holmes", author: "Arthur Conan Doyle", filePath: Bundle.main.path(forResource: "sherlock_holmes", ofType: "epub") ?? ""),
                Book(title: "Moby-Dick", author: "Herman Melville", filePath: Bundle.main.path(forResource: "moby_dick", ofType: "epub") ?? "")
            ]
        } else {
            books = [
                Book(title: "Pride and Prejudice", author: "Jane Austen", filePath: Bundle.main.path(forResource: "pride_and_prejudice", ofType: "epub") ?? "")
            ]
        }
    }
}