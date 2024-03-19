//
//  RowView.swift
//  DoorDashPractice
//
//  Created by Simon Mcneil on 2024-03-18.
//

import SwiftUI

struct RowView: View {
    private let userName: NameDetails
    private let phoneNumber: String
    private let email: String
    
    init(userName: NameDetails, phoneNumber: String, email: String) {
        self.userName = userName
        self.phoneNumber = phoneNumber
        self.email = email
    }
    
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading) {
                Text(userName.first)
                    .font(.callout)
                    .foregroundColor(.black)
                    
                Text(userName.last)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            //.padding(.horizontal)
            
            Text(phoneNumber)
                .padding(.leading)
                .lineLimit(nil)
                .frame(maxWidth: .infinity, alignment: .trailing)
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    RowView(userName: NameDetails(first: "Simon", last: "McNeil"), phoneNumber: "905-464-2344", email: "simonmcneil062@gmail.com")
}
