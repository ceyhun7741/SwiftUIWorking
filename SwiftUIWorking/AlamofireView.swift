//
//  AlamofireView.swift
//  SwiftUIWorking
//
//  Created by Yasin on 13.08.2024.
//

import SwiftUI
import Alamofire

struct AlamofireView: View {
    @State private var responseData: String = "Loading..."
    
    var body: some View {
        VStack {
            Text(responseData)
                .padding()
                .onTapGesture{
                    fetchData()
                }
        }
    }
    
    func fetchData() {
        let url = "https://jsonplaceholder.typicode.com/posts/1"
        
        AF.request(url)
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    if let json = value as? [String: Any],
                       let title = json["title"] as? String {
                        responseData = title
                    }
                case .failure(let error):
                    responseData = "Error: \(error.localizedDescription)"
                }
            }
    }
}

#Preview {
    AlamofireView()
}
