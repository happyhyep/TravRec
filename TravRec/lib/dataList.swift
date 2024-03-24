import SwiftUI

struct bucketInterface: Identifiable {
    var id: Int
    var bucketTitle: String
    var bucketImg: String
    var bucketDesct: String
    var isComplete: Bool
    var satisfactLevel: Int?
    var bucketReview: String?
}

struct travelInterface: Identifiable {
    var id: UUID
    var title: String
    var startDate: String
    var endDate: String
    var isPublic: Bool
    var titleimg: Image?
    var bucketList: [bucketInterface]
    var happyList: [String]?
    var sadList: [String]?
    
}

struct userInterface: Identifiable {
    var id: Int
    var userId: String
    var userName: String
    var userProfileImg: String
    var travelList: [travelInterface]
}


//struct travelListInterface: Identifiable {
//    var id: UUID
//    var title: String
//    var startDate: String
//    var endDate: String
//}

//var travel0 = travelListInterface(id: UUID(), title: "영국", startDate: "2023.03.04", endDate: "2023.03.19")
//var travel1 = travelListInterface(id: UUID(), title: "aㅣ국", startDate: "2023.03.04", endDate: "2023.03.19")

var travel0 = travelInterface(id: UUID(), title: "영국", startDate: "2023.03.04", endDate: "2023.03.19", isPublic: false, titleimg: Image("travrec_logo"), bucketList: [bucket1,bucket2,bucket3,bucket4], happyList: ["길가다 시장에서 양꼬치 사먹은 것", "지나가는 현지인이랑 스몰톡 해본 것"], sadList: ["축구를 못봐서 아쉬웠다...", "원래 날씨가 좋다던데 딱 내가 갔을 때 비가왔다..ㅜ"])

var travel1 = travelInterface(id: UUID(), title: "미국", startDate: "2023.05.04", endDate: "2023.05.19", isPublic: false, titleimg: Image("travrec_logo"), bucketList:  [bucket1,bucket2,bucket3,bucket4], happyList: [], sadList: [])
var travel2 = travelInterface(id: UUID(), title: "중국", startDate: "2023.05.04", endDate: "2023.05.19", isPublic: false, titleimg: Image("travrec_logo"), bucketList:  [bucket1,bucket2,bucket3,bucket4], happyList: [], sadList: [])
var travel3 = travelInterface(id: UUID(), title: "베트남", startDate: "2023.05.04", endDate: "2023.05.19", isPublic: false, titleimg: Image("travrec_logo"), bucketList:  [bucket1,bucket2,bucket3,bucket4], happyList: [], sadList: [])
var travel4 = travelInterface(id: UUID(), title: "도쿄", startDate: "2023.05.04", endDate: "2023.05.19", isPublic: false, titleimg: Image("travrec_logo"), bucketList:  [bucket1,bucket2,bucket3,bucket4], happyList: [], sadList: [])
var travel5 = travelInterface(id: UUID(), title: "오사카", startDate: "2023.05.04", endDate: "2023.05.19", isPublic: false, titleimg: Image("travrec_logo"), bucketList:  [bucket1,bucket2,bucket3,bucket4], happyList: [], sadList: [])
var travel6 = travelInterface(id: UUID(), title: "하와이", startDate: "2023.05.04", endDate: "2023.05.19", isPublic: false, titleimg: Image("travrec_logo"), bucketList:  [bucket1,bucket2,bucket3,bucket4], happyList: [], sadList: [])
var travel7 = travelInterface(id: UUID(), title: "미국", startDate: "2023.05.04", endDate: "2023.05.19", isPublic: false, titleimg: Image("travrec_logo"), bucketList:  [bucket1,bucket2,bucket3,bucket4], happyList: [], sadList: [])
var travel8 = travelInterface(id: UUID(), title: "미국", startDate: "2023.05.04", endDate: "2023.05.19", isPublic: false, titleimg: Image("travrec_logo"), bucketList:  [bucket1,bucket2,bucket3,bucket4], happyList: [], sadList: [])
var travel9 = travelInterface(id: UUID(), title: "미국", startDate: "2023.05.04", endDate: "2023.05.19", isPublic: false, titleimg: Image("travrec_logo"), bucketList:  [bucket1,bucket2,bucket3,bucket4], happyList: [], sadList: [])
var travel10 = travelInterface(id: UUID(), title: "미국", startDate: "2023.05.04", endDate: "2023.05.19", isPublic: false, titleimg: Image("travrec_logo"), bucketList:  [bucket1,bucket2,bucket3,bucket4], happyList: [], sadList: [])
var travel11 = travelInterface(id: UUID(), title: "미국", startDate: "2023.05.04", endDate: "2023.05.19", isPublic: false, titleimg: Image("travrec_logo"), bucketList:  [bucket1,bucket2,bucket3,bucket4], happyList: [], sadList: [])
var travel12 = travelInterface(id: UUID(), title: "미국", startDate: "2023.05.04", endDate: "2023.05.19", isPublic: false, titleimg: Image("travrec_logo"), bucketList:  [bucket1,bucket2,bucket3,bucket4], happyList: [], sadList: [])
var travel13 = travelInterface(id: UUID(), title: "미국", startDate: "2023.05.04", endDate: "2023.05.19", isPublic: false, titleimg: Image("travrec_logo"), bucketList:  [bucket1,bucket2,bucket3,bucket4], happyList: [], sadList: [])
var travel14 = travelInterface(id: UUID(), title: "미국", startDate: "2023.05.04", endDate: "2023.05.19", isPublic: false, titleimg: Image("travrec_logo"), bucketList:  [bucket1,bucket2,bucket3,bucket4], happyList: [], sadList: [])

var bucket1 = bucketInterface(id: 0, bucketTitle: "현지인과 스몰톡 해보기", bucketImg: "travrec_logo", bucketDesct: "", isComplete: false)
var bucket2 = bucketInterface(id: 1, bucketTitle: "비키니 입어보기", bucketImg: "", bucketDesct: "", isComplete: false)
var bucket3 = bucketInterface(id: 2, bucketTitle: "지나가는 사람 인스타 교환해보기", bucketImg: "", bucketDesct: "", isComplete: false)
var bucket4 = bucketInterface(id: 3, bucketTitle: "한번도 안 먹어본 음식 먹어보기", bucketImg: "", bucketDesct: "", isComplete: false)

var user1 = userInterface(id: 0, userId: "jhi2359", userName: "Micky", userProfileImg: "micky_profile",travelList: [travel0, travel1, travel2, travel3])
var user2 = userInterface(id: 1, userId: "negosdc", userName: "pudding", userProfileImg: "pudding_profile",travelList: [travel4, travel5, travel6])
var user3 = userInterface(id: 2, userId: "esw", userName: "bell", userProfileImg: "bell_profile",travelList: [travel3, travel8, travel10])
