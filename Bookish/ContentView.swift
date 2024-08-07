import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = BookViewModel()
    @State private var selectedBook: Book?
    @AppStorage("isDevMode") private var isDevMode: Bool = true

    var body: some View {
        NavigationStack {
            VStack {
                List(viewModel.books) { book in
                    Button(action: {
                        self.selectedBook = book
                    }) {
                        VStack(alignment: .leading) {
                            Text(book.title)
                                .font(.headline)
                            Text(book.author)
                                .font(.subheadline)
                        }
                    }
                }
                .navigationTitle("Bookish Library")
                .navigationBarItems(trailing: HStack {
                    Button(action: {
                        // Present a file picker or add new book action
                    }) {
                        Image(systemName: "plus")
                    }
                    NavigationLink(destination: SettingsView()) {
                        Image(systemName: "gearshape")
                    }
                })
            }
            .navigationDestination(isPresented: Binding<Bool>(
                get: { selectedBook != nil },
                set: { if !$0 { selectedBook = nil } }
            )) {
                if let book = selectedBook {
                    ReaderView(bookPath: book.filePath)
                }
            }
        }
        .onChange(of: isDevMode) {
            viewModel.loadBooks()
        }
    }
}
