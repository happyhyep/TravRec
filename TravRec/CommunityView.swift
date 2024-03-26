import SwiftUI

struct CommunityView: View {
    var userList: [userInterface] = [user1, user2, user3]
    @State var isBookmarkClicked: [Bool] = [false, false, false]
    
    var body: some View {
        ScrollView {
            Divider()
            
            ForEach(userList, id: \.id) {
                user in
                
                VStack(alignment: .leading) {
                    HStack {
                        Image(user.userProfileImg)
                            .resizable()
                            .clipShape(Circle())
                            .frame(width: 60, height: 60)
                            .padding(.trailing, 15)
                        VStack (alignment: .leading) {
                            Text(user.userName)
                                .font(.subheadline)
                            Text(user.travelList[0].title)
                                .font(.caption)
                        }
                        Spacer()
                        Image(systemName: "bookmark")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20)
                    }
                    
                    
                    Divider()
                        .padding(.bottom, 20)
                        .padding(.top, 10)
                    
                    Group {
                        Label("Bucket", systemImage: "checklist")
                            .font(.title3)
                            .foregroundColor(.gray)
                        
                        HStack {
                            Spacer()
                            VStack(alignment: .leading, spacing: 10) {
                                ForEach(user.travelList[0].bucketList, id: \.id) {bucket in
                                    HStack {
                                        bucket.isComplete ? Image(systemName: "checkmark.circle.fill") : Image(systemName: "checkmark.circle")
                                        Text(bucket.bucketTitle)
                                    }
                                    
                                }
                            }
                            .padding(.vertical, 30)
                            Spacer()
                        }
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(.placeholder, lineWidth: 1)
                        )
                        .padding(.bottom, 10)
                    }
                    
                    Group {
                        Label("Happy", systemImage: "hand.thumbsup")
                            .font(.title3)
                            .foregroundColor(.gray)
                        
                        HStack {
                            Spacer()
                            VStack(alignment: .leading, spacing: 10) {
                                ForEach(user.travelList[0].happyList, id: \.self) {happy in
                                    HStack {
                                        Image(systemName: "checkmark.circle.fill")
                                        Text(happy)
                                    }
                                    
                                }
                            }
                            .padding(.vertical, 30)
                            Spacer()
                        }
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(.placeholder, lineWidth: 1)
                        )
                        .padding(.bottom, 10)
                    }
                    
                    Group {
                        Label("Sad", systemImage: "hand.thumbsdown")
                            .font(.title3)
                            .foregroundColor(.gray)
                        
                        HStack {
                            Spacer()
                            VStack(alignment: .leading, spacing: 10) {
                                ForEach(user.travelList[0].sadList, id: \.self) {sad in
                                    HStack {
                                        Image(systemName: "checkmark.circle.fill")
                                        Text(sad)
                                    }
                                    
                                }
                            }
                            .padding(.vertical, 30)
                            Spacer()
                        }
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(.placeholder, lineWidth: 1)
                        )
                        .padding(.bottom, 10)
                    }
                    
                }
                .padding(.horizontal, 50)
                .padding(.bottom, 50)
                .padding(.top, 20)
            }
        }.navigationTitle("Community")
    }
}

#Preview {
    CommunityView()
}
