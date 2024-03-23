import SwiftUI

struct bucketInterface: Identifiable {
    var id: Int
    var bucketTitle: String
//    var bucketImg: Image
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


//struct travelListInterface: Identifiable {
//    var id: UUID
//    var title: String
//    var startDate: String
//    var endDate: String
//}

//var travel0 = travelListInterface(id: UUID(), title: "영국", startDate: "2023.03.04", endDate: "2023.03.19")
//var travel1 = travelListInterface(id: UUID(), title: "aㅣ국", startDate: "2023.03.04", endDate: "2023.03.19")

var travel0 = travelInterface(id: UUID(), title: "영국", startDate: "2023.03.04", endDate: "2023.03.19", isPublic: false, titleimg: Image("travelrec_logo"), bucketList: [bucket1,bucket2,bucket3,bucket4], happyList: [], sadList: [])

var travel1 = travelInterface(id: UUID(), title: "미국", startDate: "2023.05.04", endDate: "2023.05.19", isPublic: false, titleimg: Image("travelrec_logo"), bucketList:  [bucket1,bucket2,bucket3,bucket4], happyList: [], sadList: [])
var travel2 = travelInterface(id: UUID(), title: "중국", startDate: "2023.05.04", endDate: "2023.05.19", isPublic: false, titleimg: Image("travelrec_logo"), bucketList:  [bucket1,bucket2,bucket3,bucket4], happyList: [], sadList: [])
var travel3 = travelInterface(id: UUID(), title: "베트남", startDate: "2023.05.04", endDate: "2023.05.19", isPublic: false, titleimg: Image("travelrec_logo"), bucketList:  [bucket1,bucket2,bucket3,bucket4], happyList: [], sadList: [])
var travel4 = travelInterface(id: UUID(), title: "도쿄", startDate: "2023.05.04", endDate: "2023.05.19", isPublic: false, titleimg: Image("travelrec_logo"), bucketList:  [bucket1,bucket2,bucket3,bucket4], happyList: [], sadList: [])
var travel5 = travelInterface(id: UUID(), title: "오사카", startDate: "2023.05.04", endDate: "2023.05.19", isPublic: false, titleimg: Image("travelrec_logo"), bucketList:  [bucket1,bucket2,bucket3,bucket4], happyList: [], sadList: [])
var travel6 = travelInterface(id: UUID(), title: "하와이", startDate: "2023.05.04", endDate: "2023.05.19", isPublic: false, titleimg: Image("travelrec_logo"), bucketList:  [bucket1,bucket2,bucket3,bucket4], happyList: [], sadList: [])
var travel7 = travelInterface(id: UUID(), title: "미국", startDate: "2023.05.04", endDate: "2023.05.19", isPublic: false, titleimg: Image("travelrec_logo"), bucketList:  [bucket1,bucket2,bucket3,bucket4], happyList: [], sadList: [])
var travel8 = travelInterface(id: UUID(), title: "미국", startDate: "2023.05.04", endDate: "2023.05.19", isPublic: false, titleimg: Image("travelrec_logo"), bucketList:  [bucket1,bucket2,bucket3,bucket4], happyList: [], sadList: [])
var travel9 = travelInterface(id: UUID(), title: "미국", startDate: "2023.05.04", endDate: "2023.05.19", isPublic: false, titleimg: Image("travelrec_logo"), bucketList:  [bucket1,bucket2,bucket3,bucket4], happyList: [], sadList: [])
var travel10 = travelInterface(id: UUID(), title: "미국", startDate: "2023.05.04", endDate: "2023.05.19", isPublic: false, titleimg: Image("travelrec_logo"), bucketList:  [bucket1,bucket2,bucket3,bucket4], happyList: [], sadList: [])
var travel11 = travelInterface(id: UUID(), title: "미국", startDate: "2023.05.04", endDate: "2023.05.19", isPublic: false, titleimg: Image("travelrec_logo"), bucketList:  [bucket1,bucket2,bucket3,bucket4], happyList: [], sadList: [])
var travel12 = travelInterface(id: UUID(), title: "미국", startDate: "2023.05.04", endDate: "2023.05.19", isPublic: false, titleimg: Image("travelrec_logo"), bucketList:  [bucket1,bucket2,bucket3,bucket4], happyList: [], sadList: [])
var travel13 = travelInterface(id: UUID(), title: "미국", startDate: "2023.05.04", endDate: "2023.05.19", isPublic: false, titleimg: Image("travelrec_logo"), bucketList:  [bucket1,bucket2,bucket3,bucket4], happyList: [], sadList: [])
var travel14 = travelInterface(id: UUID(), title: "미국", startDate: "2023.05.04", endDate: "2023.05.19", isPublic: false, titleimg: Image("travelrec_logo"), bucketList:  [bucket1,bucket2,bucket3,bucket4], happyList: [], sadList: [])

var bucket1 = bucketInterface(id: 0, bucketTitle: "현지인과 스몰톡 해보기", bucketDesct: "", isComplete: false)
var bucket2 = bucketInterface(id: 1, bucketTitle: "비키니 입어보기", bucketDesct: "", isComplete: false)
var bucket3 = bucketInterface(id: 2, bucketTitle: "지나가는 사람 인스타 교환해보기", bucketDesct: "", isComplete: false)
var bucket4 = bucketInterface(id: 3, bucketTitle: "한번도 안 먹어본 음식 먹어보기", bucketDesct: "", isComplete: false)
