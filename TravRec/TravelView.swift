import SwiftUI
import MobileCoreServices

struct TravelView: View {
    @State var travelObj: travelInterface
    
    var carouselCategoryList = ["버킷리스트", "좋았던 기억", "아쉬웠던 기억"]
    
    @State var showImagePicker = false
    @State var selectedUIImage: UIImage?
    @State var image: Image?
    
    // TODO playground라서 style 적용 불가, Xcode에서는 주석 해제 필요
    func removeHappy(at offsets: IndexSet) {
        travelObj.happyList.remove(atOffsets: offsets)
    }
    func removeSad(at offsets: IndexSet) {
        travelObj.sadList.remove(atOffsets: offsets)
    }
    func removeBucket(at offsets: IndexSet) {
        travelObj.bucketList.remove(atOffsets: offsets)
    }
    
    func loadImage() {
        guard let selectedImage = selectedUIImage else { return }
//        image = Image(uiImage: selectedImage)
        travelObj.titleimg = Image(uiImage: selectedImage)
    }
    
    var body: some View {
//        NavigationStack {
            VStack (alignment: .leading) {
                HStack(alignment: .center){
                    if let image = travelObj.titleimg {
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .frame( height: 120)
                            .padding(30)
                    } else {
                        Button {
                            showImagePicker.toggle()
                        } label: {
                            Image(systemName: "photo.badge.plus")
                                .resizable()
                                .foregroundColor(.indigo)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 120)
                                .padding(30)
                        }
                        .sheet(isPresented: $showImagePicker, onDismiss: {
                            loadImage()
                        }) {
                            ImagePicker(image: $selectedUIImage)
                        }
                    }
                    
                    VStack(alignment: .leading) {
                        Text("\(travelObj.title)").font(.title2)
                        Text("\(travelObj.startDate) ~ \(travelObj.endDate)").font(.caption)
                    }
                }
                .padding(.horizontal, 40)
                
                Divider()
                    .padding(.horizontal, 40)
                
                TabView {
                    VStack(alignment: .leading) {
                        Text("버킷리스트").font(.largeTitle).padding(.leading,40).padding(.top, 20)
                        List {
                            ForEach($travelObj.bucketList, id: \.id) {
                                $bucketEl in
                                NavigationLink(destination: BucketDetailView(bucketObj: $bucketEl, travelObj: $travelObj), label: {
                                    HStack{
                                        bucketEl.isComplete ? Image(systemName: "checkmark.circle.fill").padding(.trailing, 10) : Image(systemName: "checkmark.circle").padding(.trailing, 10)
                                        VStack(alignment: .leading) {
                                            Text(bucketEl.bucketTitle).font(.headline)
                                        }
                                        Spacer()
                                        
                                        if (bucketEl.satisfactLevel != nil)
                                        {
                                            Text("만족도 : \(bucketEl.satisfactLevel!).0 / 5.0").font(.caption)
                                        }
                                    }
                                })
                            }
                            // TODO playground라서 style 적용 불가, Xcode에서는 주석 해제 필요
                            .onDelete(perform: removeBucket)
                        }.listStyle(.plain)
                            .frame(height: 300)
                            .background(Color.clear)
                            .padding(20)
                        
                        HStack {
                            Spacer()
                            NavigationLink(destination: AddBucketView(travelObj: $travelObj)) {
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
                        Text("좋았던 기억").font(.largeTitle).padding(.leading,40).padding(.top, 20)
                        List {
                            ForEach($travelObj.happyList, id: \.self) {
                                $bucketEl in
                                HStack{
                                    Image(systemName: "hand.thumbsup").padding(.trailing, 10)
                                    VStack(alignment: .leading) {
                                        Text(bucketEl).font(.headline)
                                    }
                                }
                                
                            }
                            // TODO playground라서 style 적용 불가, Xcode에서는 주석 해제 필요
                            .onDelete(perform: removeHappy)
                        }
                        .listStyle(.plain)
                        .frame(height: 200)
                        .background(Color.clear)
                        .padding(20)
                        
                        
                        HStack {
                            Spacer()
                            NavigationLink(destination: AddHappyView(travelObj: $travelObj)) {
                                Text("좋았던 기억 추가")
                            }.padding([.bottom, .trailing], 30)
                            
                        }
                        Spacer()
                    }
                    .tabItem {
                        Image(systemName: "circle")
                        Text("좋았던 기억")
                    }
                    
                    
                    VStack(alignment: .leading) {
                        Text("아쉬웠던 기억").font(.largeTitle).padding(.leading,40).padding(.top, 20)
                        List {
                        ForEach($travelObj.sadList, id: \.self) {
                            $bucketEl in
                            HStack{
                                Image(systemName: "hand.thumbsdown").padding(.trailing, 10)
                                VStack(alignment: .leading) {
                                    Text(bucketEl).font(.headline)
                                }
                            }
                        }                           
                        // TODO playground라서 style 적용 불가, Xcode에서는 주석 해제 필요
                        .onDelete(perform: removeSad)
                    }
                        .listStyle(.plain)
                        .frame(height: 200)
                            .background(Color.clear)
                            .padding(20)
                        
                        HStack {
                            Spacer()
                            NavigationLink(destination: AddSadView(travelObj: $travelObj)) {
                                Text("아쉬웠던 기억 추가")
                            }.padding([.bottom, .trailing], 30)
                            
                        }
                        Spacer()
                    }
                    .tabItem {
                        Image(systemName: "circle")
                        Text("아쉬웠던 기억") }
                }
                .padding(.bottom, 20)
                
//                 TODO playground라서 style 적용 불가, Xcode에서는 주석 해제 필요
//                            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                
            }
//        }
}

}
