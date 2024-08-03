import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = BookViewModel()
    @State private var selectedBook: Book?

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
                Button(action: {
                    viewModel.toggleDevMode()
                }) {
                    Text("Toggle Dev Mode")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
            .navigationDestination(isPresented: Binding<Bool>(
                get: { selectedBook != nil },
                set: { if !$0 { selectedBook = nil } }
            )) {
                if let bookPath = selectedBook?.filePath {
                    ReaderView(bookPath: bookPath)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
