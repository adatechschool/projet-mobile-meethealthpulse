//
//  EmailView.swift
//  meet_health_pulse
//
//  Created by pierre Jezequel on 07/09/2023.
//

import SwiftUI
import Combine

class ViewModel: ObservableObject {
    @Published var email = ""
}

struct EmailView: View {
    @StateObject var viewModel = ViewModel()

    var body: some View {
        VStack {
            EmailInputView(placeHolder: "Email@example.com", txt: $viewModel.email)
                .onChange(of: viewModel.email, perform: onEmailInputChanged)
        }
    }
    
    private func onEmailInputChanged(changedEmail: String) {
        print("-----> in onEmailInputChanged: \(changedEmail) ")
    }
}

struct EmailInputView: View {
    var placeHolder: String = ""
    @Binding var txt: String
    
    var body: some View {
        TextField(placeHolder, text: $txt)
            .keyboardType(.emailAddress)
            .onReceive(Just(txt)) { newValue in
                let validString = newValue.filter { "1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ._-+$!~&=#[]@".contains($0) }
                if validString != newValue {
                    self.txt = validString
                }
        }
    }
}

struct EmailView_Previews: PreviewProvider {
    static var previews: some View {
        EmailView()
    }
}
