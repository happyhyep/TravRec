import SwiftUI

struct AddTravelView: View {
    @State var title: String = ""
    @State var tempBucketList: [String] = []
    @State var tempBucketInput: String = ""
    
    @State var isClickedStartDate: Bool = false
    @State var isClickedSecondDate: Bool = false
    @State private var startDate = Date()
    @State private var secondDate = Date()
    
    
    @State var showImagePicker = false
    @State var selectedUIImage: UIImage?
    @State var image: Image?
    
    func loadImage() {
        guard let selectedImage = selectedUIImage else { return }
        image = Image(uiImage: selectedImage)
    }
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }
    
    
    
    var body: some View {
        
        VStack(spacing: 30) {
            HStack(alignment: .top) {
                VStack(spacing: 20) {
                    
                    if let image = image {
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .frame( height: 120)
                    } else {
                        Button {
                            showImagePicker.toggle()
                        } label: {
                            Image(systemName: "photo.on.rectangle.angled")
                                .resizable()
                                .foregroundColor(.gray)
                                .aspectRatio(contentMode: .fit)
//                                .symbolRenderingMode(.hierarchical)
                                .frame(width: 80)
                                .padding(30)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(.gray, lineWidth: 2)
                                        .shadow(color: .gray, radius: 3, x: 5, y: 5)
                                )
                        }
                        .sheet(isPresented: $showImagePicker, onDismiss: {
                            loadImage()
                        }) {
                            ImagePicker(image: $selectedUIImage)
                        }
                    }
                    
                    
                    
                }
                
                
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
            .padding(.horizontal, 10)
            .padding(.top, 30)
            
            VStack(alignment:.leading) {
                Text("✈️ 여행 제목").font(.title3)
                TextField("여행 제목", text: $title)
                    .font(.caption)
                    .textFieldStyle(.roundedBorder)
            }
            
            
            VStack(alignment:.leading) {
                Text("🗓️ 여행 기간").font(.title3).padding(.bottom, 10)
                ZStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 40) {
                        HStack {
                            Spacer()
                            Button(action: {
                                isClickedStartDate = !isClickedStartDate
                            }, label: {
                                Image(systemName: "calendar.badge.plus")
                                Text(startDate.formatted(date: .long, time: .omitted))
                            })
                            Spacer()
                            Text("~")
                            Spacer()
                            Button(action: {
                                isClickedSecondDate = !isClickedSecondDate
                            }, label: {
                                Image(systemName: "calendar.badge.plus")
                                Text(secondDate.formatted(date: .long, time: .omitted))
                            })
                            Spacer()
                        }
                        
                        VStack(alignment:.leading) {
                            Text("🪣 버킷리스트").font(.title3).padding(.bottom, 10)
                            Button(action: {
                                tempBucketList.append("")

                            }, label: {
                                Text("+ 추가")
                            })
                            if (tempBucketList.count > 0) {
                                List(tempBucketList, id: \.self) {
                                    bucketEn in
                                    if (bucketEn == "") {
                                        HStack {
                                            TextField("버킷리스트", text: $tempBucketInput)
                                                .font(.caption)
                                                .textFieldStyle(.roundedBorder)
                                            Button(action: {
                                                tempBucketList[tempBucketList.count-1] = tempBucketInput
                                                tempBucketInput = ""
                                            }, label: {
                                                Text("완료").font(.caption)
                                                    .border(.clear)
                                            })
                                        }
                                    }
                                    else {
                                        Text(bucketEn)
                                    }
                                }
                                .listStyle(.plain)
                                .frame(maxHeight: 400)
//                                .shadow(radius: 10)
                            }
                        }
                    }
                    HStack {
                        if (isClickedStartDate) {
                            DatePicker(selection: $startDate, in: ...Date(), displayedComponents: .date) {
                            }
                            .background(.white)
                            .padding(.trailing, 300)
                            .zIndex(100)
                            .datePickerStyle(.graphical)
                            .padding(.top, 50)
                            
                        }
                        
                        if (isClickedSecondDate) {
                            DatePicker(selection: $secondDate, in: ...Date(), displayedComponents: .date) {
                                Text("여행 마지막 날짜를 선택하세요")
                            }
                            .background(.white)
                            .padding(.leading, 300)
                            .zIndex(100)
                            .datePickerStyle(.graphical)
                            .padding(.top, 50)
                            
                        }
                    }
                }
                
            }
            
            Spacer()
        }.padding(.horizontal, 20)
    }
    
}


#Preview {
    AddTravelView()
}
