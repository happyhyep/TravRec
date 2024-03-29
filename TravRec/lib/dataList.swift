import SwiftUI

struct bucketInterface: Codable, Identifiable {
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
    var happyList: [String]
    var sadList: [String]
}

struct userInterface: Identifiable {
    var id: Int
    var userId: String
    var userName: String
    var userProfileImg: String
    var travelList: [travelInterface]
}

//struct Bucket: Codable {
//    var id: Int
//    var bucketTitle: String
//    var bucketImg: String
//    var bucketDesct: String
//    var isComplete: Bool
//    var satisfactLevel: Int?
//    var bucketReview: String?
//}


//struct travelListInterface: Identifiable {
//    var id: UUID
//    var title: String
//    var startDate: String
//    var endDate: String
//}

//var travel0 = travelListInterface(id: UUID(), title: "영국", startDate: "2023.03.04", endDate: "2023.03.19")
//var travel1 = travelListInterface(id: UUID(), title: "aㅣ국", startDate: "2023.03.04", endDate: "2023.03.19")
//@AppStorage("travelList") var travelList:[travelInterface] = [
//    travel0, travel1,travel2,travel3,travel4,travel5,travel6,travel7,travel8,travel9,travel10,travel11,travel12,travel13,travel14
//]



var travel0 = travelInterface(id: UUID(), title: "영국", startDate: "2023.03.04", endDate: "2023.03.19", isPublic: false, bucketList: [bucket1,bucket2,bucket3,bucket4], happyList: ["길가다 시장에서 양꼬치 사먹은 것", "지나가는 현지인이랑 스몰톡 해본 것"], sadList: ["축구를 못봐서 아쉬웠다...", "원래 날씨가 좋다던데 딱 내가 갔을 때 비가왔다..ㅜ"])

var travel1 = travelInterface(id: UUID(), title: "미국", startDate: "2017.05.04", endDate: "2017.05.19", isPublic: false, bucketList:  [bucket8], happyList: ["밤에 산책했는데 무드가 좋았다"], sadList: ["비가 많이 와서 날씨가 계속 흐렸다.", "야외 활동을 많이 못했다."])
var travel2 = travelInterface(id: UUID(), title: "중국", startDate: "2021.04.07", endDate: "2021.04.09", isPublic: false, bucketList:  [bucket1,bucket2,bucket3,bucket4], happyList: ["새벽에 일찍 일어나서 강 주변을 뛰었다"], sadList: ["날이 너무 더워서 얼음물 하나 사려고 했는데 너무 비싸게 받아서 별로였다."])
var travel3 = travelInterface(id: UUID(), title: "베트남", startDate: "2024.01.02", endDate: "2024.01.05", isPublic: false, bucketList:  [bucket1,bucket2,bucket3,bucket4], happyList: ["로컬 가게에서 향수를 샀더니 그 향을 맡으면 그때 여행이 기억난다."], sadList: ["바가지 당했다.."])
var travel4 = travelInterface(id: UUID(), title: "도쿄", startDate: "2022.12.12", endDate: "2022.12.15", isPublic: false, bucketList:  [bucket5, bucket6, bucket7], happyList: ["호텔 헬스장에 가봤다"], sadList: ["숙소를 대충 알아보고 갔더니 상태가 너무 안 좋아서 힘들었다."])
var travel5 = travelInterface(id: UUID(), title: "오사카", startDate: "2023.02.21", endDate: "2023.02.24", isPublic: false, titleimg: Image("images/osaka"), bucketList:  [bucket5, bucket6, bucket7], happyList: ["한번도 본 적 없는 음식을 시켜서 먹어봤다."], sadList: ["즉흥적으로 간 거라 유니버셜 티켓을 못 끊었더니 놀이기구 타는 데 줄을 한참 동안 서야했다."])
var travel6 = travelInterface(id: UUID(), title: "하와이", startDate: "2020.01.04", endDate: "2020.01.10", isPublic: false, bucketList:  [bucket8], happyList: ["다이빙 한 것"], sadList: ["완전 여름에 왔으면 더 예쁘고 좋았을 것 같다."])
var travel7 = travelInterface(id: UUID(), title: "런던", startDate: "2024.01.04", endDate: "2024.01.18", isPublic: false, bucketList:  [bucket1,bucket2,bucket3,bucket4], happyList: ["손흥민 봤다!!!!!!!!"], sadList: ["사인 받을 수 있는 시간이 따로 있는 걸 모르고 가서 손흥민 사인을 못 받았다.........."])
var travel8 = travelInterface(id: UUID(), title: "독일", startDate: "2024.01.22", endDate: "2024.01.25", isPublic: false, titleimg: Image("images/germany"), bucketList:  [bucket9, bucket10, bucket4, bucket3, bucket1], happyList: ["뮌헨 경기 직관!!!!!!!!!!!!!"], sadList: ["뮌헨 경기를 하나 더 보고싶었는데 미리 티켓팅을 안 했어서 아쉬웠다."])
var travel9 = travelInterface(id: UUID(), title: "발리", startDate: "2019.03.04", endDate: "2019.03.07", isPublic: false,  bucketList:  [bucket1,bucket2,bucket3,bucket4], happyList: ["노을질 때 해변가를 봤는데 너무너무너무 예뻐서 기억에 남는다"], sadList: ["이 여행지에 대한 정보가 거의 없어서 조금 더 조사해왔으면 더 좋은 볼거리가 많았을 것 같다."])
var travel10 = travelInterface(id: UUID(), title: "괌", startDate: "2012.05.04", endDate: "2012.05.19", isPublic: false,  bucketList:  [bucket1,bucket2,bucket3,bucket4], happyList: ["시장에서 파는 코코넛 주스 맛이 잊혀지질 않음"], sadList: [])
var travel11 = travelInterface(id: UUID(), title: "다낭", startDate: "2018.05.04", endDate: "2018.05.19", isPublic: false, bucketList:  [bucket1,bucket2,bucket3,bucket4], happyList: ["날씨가 더울 줄 알았는데 시원해서 좋았음"], sadList: ["돈을 좀 더 들여서 숙소를 더 좋은데 했다면 좋았을 것 같다."])
var travel12 = travelInterface(id: UUID(), title: "방콕", startDate: "2023.08.04", endDate: "2023.08.06", isPublic: false, bucketList:  [bucket1,bucket2,bucket3,bucket4], happyList: ["나라 이름부터 집에서 방콕한 것 같아서 좋음 ㅋㅎ"], sadList: ["너무 더웠다.. 부채라도 챙겨갈 걸 그랬다."])
var travel13 = travelInterface(id: UUID(), title: "후쿠오카", startDate: "2019.04.04", endDate: "2019.04.08", isPublic: false, bucketList:  [bucket5, bucket6, bucket7], happyList: ["벚꽃 맛집"], sadList: ["갔을 때 다른 지역에서 지진이 났다고 해서 무서웠다."])
var travel14 = travelInterface(id: UUID(), title: "아프리카", startDate: "2023.07.04", endDate: "2023.07.19", isPublic: false, bucketList:  [bucket1,bucket2,bucket3,bucket4], happyList: ["봉사 다녀왔는데 티비에서 본것보다, 생각보다 좋았음"], sadList: ["날이 너무너무너무 더운데 에어컨이나 선풍기가 없어서 힘들었다. 다음엔 무조건 부채 가져가야겠다.", "햇빛이 너무 세서 다 타버렸다. 선크림은 잔뜩 가지고 가야 했다."])

var bucket1 = bucketInterface(id: 0, bucketTitle: "현지인과 스몰톡 해보기", bucketImg: "images/small_talk", bucketDesct: "다른 나라 말로 스몰톡 꼭 해보자!!! 바디 랭기지 써서라도, 파파고 써서라도 꼭 해보기!!!", isComplete: true, satisfactLevel: 4, bucketReview: "너무너무너무너무 좋았다ㅠㅠ 사실 못 알아들은 말이 대부분이긴 하지만... 그래도 사람들이 친절하게 받아줫다 ㅎㅎ 심지어 종업원이 나 발음 되게 좋다고 했다 ㅎ")
var bucket2 = bucketInterface(id: 1, bucketTitle: "비키니 입어보기", bucketImg: "images/swimmer", bucketDesct: "평소에는 그런거 못 입지만 다른 나라에서는 꼭 해변가에서 입어봐야지!", isComplete: false)
var bucket3 = bucketInterface(id: 2, bucketTitle: "지나가는 사람 인스타 교환해보기", bucketImg: "images/instagram", bucketDesct: "", isComplete: false)
var bucket4 = bucketInterface(id: 3, bucketTitle: "한번도 안 먹어본 음식 먹어보기", bucketImg: "images/strange_food", bucketDesct: "검색해보니까 이상한 음식도 많아보이던데,, 인생에서 살면서 한번쯤은 도전해보고 싶다! 대신 다신 안 먹을거야 ㅎ", isComplete: false)
var bucket5 = bucketInterface(id: 4, bucketTitle: "사쿠라 꽃 구경하기", bucketImg: "", bucketDesct: "일본 하면 벚꽃이지ㅠㅠ", isComplete: false)
var bucket6 = bucketInterface(id: 5, bucketTitle: "스시 전문점에서 고급 스시 즐기기", bucketImg: "", bucketDesct: "일본에서 직접 해주는 고급 스시는 어떤 맛일까,,", isComplete: false)
var bucket7 = bucketInterface(id: 6, bucketTitle: "검색 없이 라멘 파는 아무 가게에서 라멘 시켜 먹어보기", bucketImg: "", bucketDesct: "일본 본토 로컬 가게에서 먹는 라멘은 어떨지 궁금하다,, 솔직히 이미 유명한 곳은 로컬 가게라고 할 수 없어ㅡㅡ", isComplete: false)
var bucket8 = bucketInterface(id: 7, bucketTitle: "카지노 다녀오기", bucketImg: "", bucketDesct: "솔직히 여기 아니면 내가 카지노를 언제 가보겠어 ㅎ", isComplete: false)
var bucket9 = bucketInterface(id: 8, bucketTitle: "베를린 벽 구경하기", bucketImg: "images/germany_wall", bucketDesct: "뮌헨 경기 다음으로 꼭 보고싶었던 베를린 벽..", isComplete: false)
var bucket10 = bucketInterface(id: 9, bucketTitle: "뮌헨 경기 직관", bucketImg: "images/munchen", bucketDesct: "김민재 봐야지ㅠㅠ", isComplete: true, satisfactLevel: 5, bucketReview: "드디어 그렇게 바라던 뮌헨 경기....ㅠㅠㅠ 하나만 티켓팅한게 정말... 가문의 수치다.")

var user1 = userInterface(id: 0, userId: "jhi2359", userName: "Micky", userProfileImg: "images/micky_profile",travelList: [travel0, travel1, travel2, travel3])
var user2 = userInterface(id: 1, userId: "negosdc", userName: "pudding", userProfileImg: "images/pudding_profile",travelList: [travel4, travel5, travel6])
var user3 = userInterface(id: 2, userId: "esw", userName: "bell", userProfileImg: "images/bell_profile",travelList: [travel3, travel8, travel10])


var happy1 = "길가다 시장에서 양꼬치 사먹은 것"
var happy2 = "지나가는 현지인이랑 스몰톡 해본 것"
var happy3 = "밤에 산책했는데 무드가 좋았다"
var happy4 = "새벽에 일찍 일어나서 강 주변을 뛰었다"
var happy5 = "로컬 가게에서 향수를 샀더니 그 향을 맡으면 그때 여행이 기억난다."
var happy6 = "호텔 헬스장에 가봤다"
var happy7 = "한번도 본 적 없는 음식을 시켜서 먹어봤다."

var sad1 = "축구를 못 봐서 아쉬웠다.."
var sad2 = "원래 날씨가 좋다던데 내가 갔을 때 비가 왔다..ㅠ"
var sad3 = "밤에 산책했는데 무드가 좋았다"
var sad4 = "새벽에 일찍 일어나서 강 주변을 뛰었다"
var sad5 = "로컬 가게에서 향수를 샀더니 그 향을 맡으면 그때 여행이 기억난다."
var sad6 = "호텔 헬스장에 가봤다"
var sad7 = "한번도 본 적 없는 음식을 시켜서 먹어봤다."
