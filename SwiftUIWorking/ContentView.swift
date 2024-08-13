//
//  ContentView.swift
//  SwiftUIWorking
//
//  Created by Yasin on 13.08.2024.
//

import SwiftUI
import CDAlertView

// UIViewController Extension
extension UIViewController {
    func showAlert(title: String, message: String, alertType: CDAlertViewType = .notification) {
        let alert = CDAlertView(title: title, message: message, type: alertType)
        let doneAction = CDAlertViewAction(title: "Done")
        alert.add(action: doneAction)
        alert.show()
    }
}

// SwiftUI'de Kullanım
struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Tap me")
                .onTapGesture {
                    showCustomAlert(title: "Hello", message: "This is a custom alert view")
                }
        }
        .padding()
    }
    
    func showCustomAlert(title: String, message: String) {
        guard let rootVC = UIApplication.shared.windows.first?.rootViewController else { return }
        rootVC.showAlert(title: title, message: message)
    }
}

#Preview {
    ContentView()
}
