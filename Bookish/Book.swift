import Foundation

struct Book: Identifiable {
    var id = UUID()
    var title: String
    var author: String
    var filePath: String
}
