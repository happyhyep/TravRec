import SwiftUI
import MobileCoreServices

struct TravelView: View {
    var travelObj: travelInterface
    
    var carouselCategoryList = ["버킷리스트", "좋았던 기억", "아쉬웠던 기억"]
    
    var body: some View {
        NavigationStack {
            VStack (alignment: .leading) {
                HStack(alignment: .center){
                    Image(systemName: "photo.on.rectangle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100)
                        .foregroundColor(.indigo)
                        .padding(.trailing, 20)
                    VStack(alignment: .leading) {
                        Text("\(travelObj.title)").font(.title2)
                        Text("\(travelObj.startDate) ~ \(travelObj.endDate)").font(.caption)
                    }
                }
                .padding(.horizontal, 40)
                
                TabView {
                    VStack(alignment: .leading) {
                        Text("버킷리스트").font(.largeTitle).padding([.top, .leading],40)
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
                            .frame(height: 200)
                            .background(Color.white)
                            .padding(20)
                        
                        HStack {
                            Spacer()
                            NavigationLink(destination: BucketDetailView(bucketObj: bucket1)) {
                                Text("버킷리스트 추가")
                            }.padding([.bottom, .trailing], 30)

                        }
                        Spacer()
                    }
                    .tabItem {
                        Image(systemName: "circle")
                        Text("버킷리스트")
                    }
                    
                    
                    VStack(alignment: .leading) {
                        Text("좋았던 기억").font(.largeTitle).padding([.top, .leading],40)
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
                    }
                    .tabItem {
                        Image(systemName: "circle")
                        Text("좋았던 기억")
                    }
                    
                    
                    VStack(alignment: .leading) {
                        Text("아쉬웠던 기억").font(.largeTitle).padding([.top, .leading],40)
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
                        
                    }
                    .tabItem {
                        Image(systemName: "circle")
                        Text("아쉬웠던 기억") }
                }
                .padding(.bottom, 20)
                
                // TODO playground라서 style 적용 불가, Xcode에서는 주석 해제 필요
                //            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                
            }
        }
}

}
