import SwiftUI

struct AddBucketView: View {
    @Binding var travelObj: travelInterface
    
    
    @State var bucketTitleInput: String = ""
     @State var bucketDescInput: String = ""
    
    @State var showImagePicker = false
    @State var selectedUIImage: UIImage?
    @State var image: Image?
    
    func loadImage() {
        guard let selectedImage = selectedUIImage else { return }
        image = Image(uiImage: selectedImage)
    }
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 30) {
            VStack {
                HStack(alignment: .bottom) {
                    Text("\(travelObj.title)").font(.title)
                    Text("\(travelObj.startDate) ~ \(travelObj.endDate)").font(.caption)
                    Spacer()
                }.padding(.top, 40)
                Divider()
                
                HStack(alignment: .center){
                    Group {
                        if let image = image {
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                .frame( height: 120)
                        } else {
                            Button {
                                showImagePicker.toggle()
                            } label: {
                                Image(systemName: "photo.on.rectangle.angled")
                                    .resizable()
                                    .foregroundStyle(.gray)
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 80)
                                    .padding(30)
                            }
                            .sheet(isPresented: $showImagePicker, onDismiss: {
                                loadImage()
                            }) {
                                ImagePicker(image: $selectedUIImage)
                            }
                        }
                    }
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(.gray, lineWidth: 3)
                    )
                    
                    
                    //                VStack(alignment: .leading) {
                    //                    Text("\(travelObj.title)").font(.title2)
                    //                    Text("\(travelObj.startDate) ~ \(travelObj.endDate)").font(.caption)
                    //                }
                    Spacer()
                }
                .navigationTitle("버킷리스트 추가")
                .padding(.top, 30)
            }
            
            VStack(alignment:.leading) {
                Text("버킷리스트 타이틀").font(.title3)
                TextField("버킷리스트 타이틀", text: $bucketTitleInput)
                    .font(.caption)
                    .textFieldStyle(.roundedBorder)
            }
            
            

            VStack(alignment:.leading) {
                    Text("상세 설명").font(.title3)
                    TextEditor(text: $bucketDescInput)
                        .frame(height: 100, alignment: .top)
                        .cornerRadius(10)
                        .font(.caption)
                        .textFieldStyle(.roundedBorder)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(.placeholder, lineWidth: 1)
                        )
            }
            
            Spacer()
            
            Button(action: {
            }, label: {
                Label(
                    title: { Text("버킷리스트 추가하기") },
                    icon: { Image(systemName: "plus") }
                )
                    .font(.headline)
                    .padding(5)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity, maxHeight: 50)
                    .background(.indigo)
                    .cornerRadius(10)
                    .shadow(radius: 5, x: 5, y:5)
                
            }).padding(.bottom, 50)
        }
        .padding(.horizontal, 30)
    }
}

