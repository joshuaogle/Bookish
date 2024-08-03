import SwiftUI

struct SettingsView: View {
    @AppStorage("fontSize") var fontSize: Double = 14.0

    var body: some View {
        Form {
            Section(header: Text("Font Size")) {
                Slider(value: $fontSize, in: 10...30, step: 1) {
                    Text("Font Size")
                }
                Text("Preview text with size \(fontSize, specifier: "%.0f")")
                    .font(.system(size: CGFloat(fontSize)))
            }
        }
        .navigationTitle("Settings")
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
