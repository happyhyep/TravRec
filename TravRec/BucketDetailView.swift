import SwiftUI

struct BucketDetailView: View {
    @Binding var bucketObj: bucketInterface
    
    @State var clickedStarCount: Int = 0
    @State var starList: [Bool] = [false, false, false, false, false]
    
    @State var tempBucketReview: String = ""
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 40) {
            Text("< \(bucketObj.bucketTitle) > 버킷리스트")
                .padding(.top,30)
                .font(.title3)
                .foregroundStyle(.indigo)
            Divider()
            HStack {
                Spacer()
                if (bucketObj.bucketImg == "") {
                    Image(systemName: "photo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .frame(width: 300)
                } else {
                    Group {
                        Image("\(bucketObj.bucketImg)")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 300)
                    }
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(.indigo, lineWidth: 3)
                    )
                }
                Spacer()
            }
            Divider()
            GroupBox(label: Label("상세 설명", systemImage: "folder.badge.questionmark")) {
                bucketObj.bucketDesct != "" ? Text("\(bucketObj.bucketDesct)") :
                Text("버킷리스트에 대한 상세 설명이 들어갈 곳입니다. \n하지만 '\(bucketObj.bucketTitle)' 버킷리스트의 상세 설명이 존재하지 않습니다.")
            }
            
            if (bucketObj.isComplete) {
                HStack {
                    Text("만족도 : ")
                    Spacer()
                    Button(action: {
                        if (clickedStarCount >= 1) {
                            clickedStarCount -= 1
                        }
                    }, label: {
                        Image(systemName: "minus")
                    }).padding(.horizontal, 10)
                    
                    ForEach(0..<clickedStarCount, id: \.self) { idx in
                        Image(systemName: "star.fill")
                            .foregroundStyle(.yellow)
                    }
                    ForEach(0..<(5 - clickedStarCount), id: \.self) { idx in
                        Image(systemName: "star")
                    }
                    Button(action: {
                        if (clickedStarCount <= 4) {
                            clickedStarCount += 1
                        }
                    }, label: {
                        Image(systemName: "plus")
                    }).padding(.horizontal, 10)
                    Spacer()
                }
                GroupBox(label: Label("느낀점", systemImage: "arrow.right.to.line.compact")) {
                    TextField("느낀점을 작성해주세요.", text: $tempBucketReview)
                        .font(.caption)
                        .textFieldStyle(.roundedBorder)
                }
            }
            
            
            Spacer()
            
            if (!bucketObj.isComplete) {
                Button(action: {
                    bucketObj.isComplete = true
                }, label: {
                    Label(
                        title: { Text("이 버킷리스트를 이루었습니다.") },
                        icon: { Image(systemName: "checkmark") }
                    )
                    .font(.headline)
                    .padding(5)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity, maxHeight: 50)
                    .background(.indigo)
                    .cornerRadius(10)
                    .shadow(radius: 5, x: 5, y:5)
                    
                }).padding(.bottom, 50)
            } else {
                Button(action: {
                }, label: {
                    Text("작성 완료")
                        .font(.headline)
                        .padding(5)
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity, maxHeight: 50)
                        .background(.indigo)
                        .cornerRadius(10)
                        .shadow(radius: 5, x: 5, y:5)
                    
                }).padding(.bottom, 50)
            }
            
        } .padding(.horizontal, 30)
    }
}

