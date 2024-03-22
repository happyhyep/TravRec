//
//  AddTravelView.swift
//  TravRec
//
//  Created by jeong hyein on 3/22/24.
//

import SwiftUI

struct AddTravelView: View {
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "photo.on.rectangle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100)
                    .foregroundColor(.indigo)
                
                Spacer()
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    HStack{
                        Image(systemName: "lock.open.fill")
                        Text("공개")
                    }
                    .padding(4)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(.indigo, lineWidth: 1)
                    )
                })
            }
            .padding(.horizontal, 30)

        }
    }
}


#Preview {
    AddTravelView()
}
