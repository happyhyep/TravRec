import SwiftUI


enum publicOrPrivateEnum: String {
    case pub = "공개"
    case priv = "비공개"
}

struct AddTravelView: View {
    @Binding var travelList: [travelInterface]
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State var title: String = ""
    @State var tempBucketList: [bucketInterface] = []
    @State var tempBucketInput: String = ""
    

    
    @State var isClickedStartDate: Bool = false
    @State var isClickedSecondDate: Bool = false
    @State private var startDate = Date()
    @State private var secondDate = Date()
    
    
    @State var showImagePicker = false
    @State var selectedUIImage: UIImage?
    @State var image: Image?
    
    @State var publicOrPrivate: publicOrPrivateEnum = .priv

    
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
                                    .aspectRatio(contentMode: .fit)
                                    .foregroundStyle(.gray)
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
                }
                
                
                Spacer()
                Button(action: {
                    if (publicOrPrivate == .pub) {
                        publicOrPrivate = .priv
                    } else {
                        publicOrPrivate = .pub
                    }
                }, label: {
                    HStack{
                        ( publicOrPrivate == .pub ) ? Image(systemName: "lock.open.fill") : Image(systemName: "lock.fill")
                        Text(publicOrPrivate.rawValue)
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
            
            Divider()
            
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
                                tempBucketList.append(bucketInterface(id: tempBucketList.count, bucketTitle: "", bucketImg: "", bucketDesct: "", isComplete: false))

                            }, label: {
                                Label("추가 +", systemImage: "text.append")
                            })
                            if (tempBucketList.count > 0) {
                                List(tempBucketList, id: \.id) {
                                    bucketEn in
                                    if (bucketEn.bucketTitle == "") {
                                        HStack {
                                            TextField("버킷리스트", text: $tempBucketInput)
                                                .font(.caption)
                                                .textFieldStyle(.roundedBorder)
                                            Button(action: {
                                                tempBucketList[tempBucketList.count-1].bucketTitle = tempBucketInput
                                                tempBucketInput = ""
                                            }, label: {
                                                Text("완료").font(.caption)
                                                    .border(.clear)
                                            })
                                        }
                                    }
                                    else {
                                        Text(bucketEn.bucketTitle)
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
                            DatePicker(selection: $startDate, displayedComponents: .date) {
                            }
                            .background(.white)
                            .padding(.trailing, 300)
                            .zIndex(100)
                            .datePickerStyle(.graphical)
                            .padding(.top, 50)
                            
                        }
                        
                        if (isClickedSecondDate) {
                            DatePicker(selection: $secondDate, in: startDate..., displayedComponents: .date) {
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
            
            Button(action: {
//                for i in tempBucketList {
//                    tempBucketInterface.append(bucketInterface(id: Int(tempBucketList.firstIndex(of: i)), bucketTitle: i, bucketImg: "", bucketDesct: "", isComplete: false))
//                }
                travelList.append(travelInterface(id: UUID(), title: title, startDate: dateToString(date: startDate), endDate: dateToString(date: secondDate), isPublic: publicOrPrivate == .pub ? true : false, titleimg: Image(""), bucketList: tempBucketList, happyList: [], sadList: []))
                self.presentationMode.wrappedValue.dismiss()
            }, label: {
                Text("작성 완료")
                    .font(.headline)
                .padding(5)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity, maxHeight: 50)
                .background(.indigo)
                    .cornerRadius(10)
                    .shadow(radius: 5, x: 5, y:5)
//                    .overlay(
//                        RoundedRectangle(cornerRadius: 5)
//                            .fill()
//                            .stroke(.indigo, lineWidth: 1)
//
//                    )
            }).padding(.bottom, 50)
        }.padding(.horizontal, 20)
        .navigationTitle("여행 추가")
    }
    
}

