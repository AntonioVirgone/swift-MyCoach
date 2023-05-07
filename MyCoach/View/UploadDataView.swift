//
//  ContentView.swift
//  MyCoach
//
//  Created by Antonio Virgone on 30/04/23.
//

import SwiftUI

struct UploadDataView: View {
    @State var posts = TrainingDataController.find()

    var body: some View {
        ZStack {
            bgAppColorDark.edgesIgnoringSafeArea(.all)
            
            VStack {
                VStack(spacing: 25) {
                    HStack(spacing: 15) {
                        Button {
                            save(filename: "scheda_antonio_a.json")
                        } label: {
                            Text("Add Scheda A")
                        }
                        Button {
                            save(filename: "scheda_antonio_b.json")
                        } label: {
                            Text("Add Scheda B")
                        }
                        Button {
                            save(filename: "scheda_antonio_c.json")
                        } label: {
                            Text("Add Scheda C")
                        }
                    }
                    
                    Button {
                        delete()
                    } label: {
                        Text("Delete posts")
                    }
                }
                List {
                    ForEach(posts, id: \.self) { post in
                        VStack {
                            Text(post.title)
                            ForEach(post.trainings, id: \.self) { comment in
                                VStack {
                                    Text(comment.code ?? "")
                                    Text(comment.value)
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    private func save(filename: String) {
        TrainingDataController.savePost(filename: filename)
        posts = TrainingDataController.find()
    }
    
    private func delete() {
        TrainingDataController.delete()
        posts = TrainingDataController.find()
    }
}

struct UploadDataView_Previews: PreviewProvider {
    static var previews: some View {
        UploadDataView()
    }
}
