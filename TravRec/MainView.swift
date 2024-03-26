import SwiftUI

enum CategoryDropdown: String {
    case travel = "여행별 기억"
    case happy = "좋았던 기억"
    case sad = "아쉬웠던 기억"
}

enum sortStandardEnum: String {
    case date = "생성한 순"
    case dictionary = "ㄱㄴㄷ순"
}

//struct bucketInterface: Identifiable {
//    var key: UUID
//    var bucketTitle: String
//    var bucketImg: Image
//    var bucketDesct: String
//    var isComplete: Bool
//    var satisfactLevel: Int?
//    var bucketReview: String?
//}
//
//struct travelInterface: Identifiable {
//    var key: UUID
//    var title: String
//    var startDate: Date
//    var endDate: Date
//    var isPublic: Bool
//    var titleimg: Image
//    var bucketList: [bucketInterface]
//    var happyList: [String]
//    var sadList: [String]
//
//}

//struct travelListInterface: Identifiable {
//    var id: Int
//    var title: String
//    var startDate: String
//    var endDate: String
//}
//
//var travel0 = travelListInterface(id: 0, title: "영국", startDate: "2023.03.04", endDate: "2023.03.19")
//var travel1 = travelListInterface(id: 1, title: "aㅣ국", startDate: "2023.03.04", endDate: "2023.03.19")

struct MainView: View {
    @State var categoryDropdownLabel:CategoryDropdown = .travel
     @State var sortStandard:sortStandardEnum = .date
    
    @State var travelList = [
        travel0, travel1,travel2,travel3,travel4,travel5,travel6,travel7,travel8,travel9,travel10,travel11,travel12,travel13,travel14
    ]

    @State var sortedTravelList: [travelInterface] = []
    
//    @State var happyList: [String] = [happy1, happy2, happy3, happy4, happy5, happy6, happy7]
    
    
    var body: some View {
        NavigationStack {
       
                VStack (alignment: .center) {
                    HStack {
                        Image("travrec_logo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 200)
                            .padding(.bottom, 10)
                        Spacer()
                        NavigationLink(destination: CommunityView(), label: {
                            Image(systemName: "sparkle.magnifyingglass")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 30)
                                .foregroundColor(Color(.systemIndigo))
                                .padding(.trailing,20)
                        })
                        Image(systemName: "person.crop.circle")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30)
                            .foregroundColor(Color(.systemIndigo))
                            .padding(.trailing,20)
                    }
                
                
                ZStack {
                    VStack {
                        HStack {
                            // 여행별/아쉬웠던/좋았던 분류 드롭다운
                            Menu {
                                Button {
                                    categoryDropdownLabel = .travel
                                } label: {
                                    Text("여행별 기억")
                                }
                                Button {
                                    categoryDropdownLabel = .happy
                                } label: {
                                    Text("좋았던 기억")
                                }
                                Button {
                                    categoryDropdownLabel = .sad
                                } label: {
                                    Text("아쉬웠던 기억")
                                }
                            } label: {
                                HStack {
                                    Text(categoryDropdownLabel.rawValue).font(.caption)
                                    Image(systemName: "chevron.down")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 8)
                                }
                                .padding(5)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(.indigo, lineWidth: 1.5)
                                )
                            }
                            Spacer()
                            
                            Button {
                                if (sortStandard == .date) {
                                    sortStandard = .dictionary
                                    sortedTravelList = travelList.sorted {$0.title < $1.title}
                                } else {
                                    sortStandard = .date
                                }
                            } label: {
                                Text(sortStandard.rawValue).font(.caption)
                                Image(systemName: "arrow.up.arrow.down")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 10)
                            }
                            .padding(4)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(.indigo, lineWidth: 1)
                            )
                        }.padding(.horizontal, 30)
                        
                        if (categoryDropdownLabel == .travel) {
                            List(sortStandard == .date ? travelList : sortedTravelList, id: \.id) {
                                travelEl in
                                NavigationLink(destination: TravelView(travelObj: travelEl), label: {
                                    HStack{
                                        Image(systemName: "folder").padding(.trailing, 10)
                                        VStack(alignment: .leading) {
                                            Text(travelEl.title).font(.headline)
                                            Text("(\(travelEl.startDate) ~ \(travelEl.endDate))").font(.caption)
                                        }
                                    }
                                })
                            }
                            .listStyle(.plain)
                            .padding(20)
                        } else if (categoryDropdownLabel == .happy) {

                            List(travelList, id: \.id) {
                                travelEl in
                                ForEach(travelEl.happyList, id: \.self) {
                                    hap in
                                    NavigationLink(destination: TravelView(travelObj: travelEl), label: {
                                        HStack{
                                            Image(systemName: "hand.thumbsup").padding(.trailing, 10)
                                            VStack(alignment: .leading) {
                                                Text(hap).font(.headline)
                                                Text("\(travelEl.title) (\(travelEl.startDate) ~ \(travelEl.endDate))").font(.caption)
                                            }
                                        }
                                    })
                                }

                            }
                            .listStyle(.plain)
                            .padding(20)
                        }  else if (categoryDropdownLabel == .sad) {
                            List(travelList, id: \.id) {
                                travelEl in
                                ForEach(travelEl.sadList , id: \.self) {
                                    sad in
                                    NavigationLink(destination: TravelView(travelObj: travelEl), label: {
                                        HStack{
                                            Image(systemName: "hand.thumbsdown").padding(.trailing, 10)
                                            VStack(alignment: .leading) {
                                                Text(sad).font(.headline)
                                                Text("\(travelEl.title) (\(travelEl.startDate) ~ \(travelEl.endDate))").font(.caption)
                                            }
                                        }
                                    })
                                }
                                
                            }
                            .listStyle(.plain)
                            .padding(20)
                        }
                        Spacer()
                    }
                    HStack(alignment: .bottom) {
                        Spacer()
                        NavigationLink(destination: AddTravelView(), label: {
                            Image(systemName: "square.and.pencil.circle.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width:60)
                            //                            .offset(x:170, y: -50)
                                .foregroundColor(Color(.systemIndigo))
                                .zIndex(10)
                        })
                        .padding(.top, 700)
                        .padding(.trailing, 30)
                    }
                }

            }
        }
    }
}
