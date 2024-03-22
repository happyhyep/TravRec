import SwiftUI

enum CategoryDropdown: String {
    case travel = "여행별 기억"
    case happy = "좋았던 기억"
    case sad = "아쉬웠던 기억"
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

struct travelListInterface: Identifiable {
    var id: Int
    var title: String
    var startDate: String
    var endDate: String
}

var travel0 = travelListInterface(id: 0, title: "영국", startDate: "2023.03.04", endDate: "2023.03.19")
var travel1 = travelListInterface(id: 1, title: "aㅣ국", startDate: "2023.03.04", endDate: "2023.03.19")

struct MainView: View {
    @State var categoryDropdownLabel:CategoryDropdown = .travel

    
    @State var travelList = [
        travel0, travel1
    ]
    
    var body: some View {
        VStack (alignment: .center) {
            HStack {
                Image("travrec_logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200)
                Spacer()
                Image(systemName: "person.crop.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30)
                    .foregroundColor(Color(.systemIndigo))
                    .padding(.trailing,20)
            }
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
                
                } label: {
                    Text("날짜순").font(.caption)
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
            
            // 기억 리스트
            List(travelList, id: \.id) {
                travelEn in
                HStack {
                    Text(travelEn.title)
                    Text("(\(travelEn.startDate) ~ \(travelEn.endDate))").font(.caption)
                    Spacer()
                    Image(systemName: "chevron.right")
                }
            }.background(.black)
            
//            List(travelList, id: \.id) {
//                travelEl in
//                NavigationLink(travelEl.title, destination: ContentView(mountain: mountain))
//
//            } } detail: {
//
//            }
        }
    }
}
