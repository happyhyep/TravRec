import SwiftUI
import MobileCoreServices

struct TravelView: View {
    @State var travelObj: travelInterface
    
    var carouselCategoryList = ["버킷리스트", "좋았던 기억", "아쉬웠던 기억"]
    
    @State var showImagePicker = false
    @State var selectedUIImage: UIImage?
    @State var image: Image?
    
    func loadImage() {
        guard let selectedImage = selectedUIImage else { return }
        image = Image(uiImage: selectedImage)
    }
    
    var body: some View {
//        NavigationStack {
            VStack (alignment: .leading) {
                HStack(alignment: .center){
                    if let image = image {
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
                        List($travelObj.bucketList, id: \.id) {
                            $bucketEl in
                            NavigationLink(destination: BucketDetailView(bucketObj: $bucketEl), label: {
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
                        List($travelObj.bucketList, id: \.id) {
                            $bucketEl in
                            NavigationLink(destination: BucketDetailView(bucketObj: $bucketEl), label: {
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
                        Text("아쉬웠던 기억").font(.largeTitle).padding(.leading,40).padding(.top, 20)
                        List($travelObj.bucketList, id: \.id) {
                            $bucketEl in
                            NavigationLink(destination: BucketDetailView(bucketObj: $bucketEl), label: {
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
//        }
}

}
