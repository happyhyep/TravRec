//
//  TravelView.swift
//  TravRec
//
//  Created by jeong hyein on 3/22/24.
//

import SwiftUI
import MobileCoreServices

struct TravelView: View {
     var travelObj: travelInterface


    
    var body: some View {
        VStack (alignment: .trailing) {
            HStack(alignment: .top){
                Image(systemName: "photo.on.rectangle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100)
                    .foregroundColor(.indigo)
                Text("\(travelObj.title)").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                
            }
            .padding(.horizontal, 30)
            
            TabView {
                VStack {
                    Text("버킷리스트").font(.title)
                    List(travelObj.bucketList, id: \.id) {
                        bucketEl in
                        NavigationLink(destination: BucketDetailView(bucketObj: bucketEl), label: {
                            HStack{
                                Image(systemName: "checkmark.circle").padding(.trailing, 10)
                                VStack(alignment: .leading) {
                                    Text(bucketEl.bucketTitle).font(.headline)
                                }
                            }
                        })
                    }.listStyle(.plain)
                        .background(Color.white)
                        .padding(20)
                    
//                    Color.red
                }
                .tabItem { Image(systemName: "circle") }
                
                VStack {
                    Text("버킷리스트").font(.title)
                    List(travelObj.bucketList, id: \.id) {
                        bucketEl in
                        NavigationLink(destination: BucketDetailView(bucketObj: bucketEl), label: {
                            HStack{
                                Image(systemName: "folder").padding(.trailing, 10)
                                VStack(alignment: .leading) {
                                    Text(bucketEl.bucketTitle).font(.headline)
                                }
                            }
                        })
                    }.listStyle(.plain)
                        .background(Color.white)
                        .padding(20)
//                    Color.blue
                }
                .tabItem { Image(systemName: "circle") }
                
                VStack {
                    Text("버킷리스트").font(.title)
                    List(travelObj.bucketList, id: \.id) {
                        bucketEl in
                        NavigationLink(destination: BucketDetailView(bucketObj: bucketEl), label: {
                            HStack{
                                Image(systemName: "folder").padding(.trailing, 10)
                                VStack(alignment: .leading) {
                                    Text(bucketEl.bucketTitle).font(.headline)
                                }
                            }
                        })
                    }.listStyle(.plain)
                        .background(Color.white)
                        .padding(20)
//                    Color.green
                }
                .tabItem { Image(systemName: "circle") }
            }
            .frame(width: 500, height: 200)
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
        }
        
    }
    
}
