//
//  TaskListView.swift
//  SwiftUITodo
//
//  Created by Suyeol Jeon on 03/06/2019.
//  Copyright © 2019 Suyeol Jeon. All rights reserved.
//

import SwiftUI

struct TaskListView: View {
  @EnvironmentObject var userData: UserData
  @State var draftTitle: String = ""
  @State var isEditing: Bool = false

  var body: some View {
    List {
      if !self.isEditing {
        HStack {
          TextField($draftTitle, placeholder: Text("Create a New Task..."), onCommit: self.createTask)
        }
      }

      ForEach(self.userData.tasks.identified(by: \.self)) { task in
        TaskItemView(task: task, isEditing: self.$isEditing)
      }
    }
    .navigationBarItem(title: Text("Tasks 👀"))
    .navigationBarItems(trailing: Button(action: { self.isEditing.toggle() }) {
      if !self.isEditing {
        Text("Edit")
      } else {
        Text("Done")
      }
    })
  }

  private func createTask() {
    let newTask = Task(title: self.draftTitle, isDone: false)
    self.userData.tasks.insert(newTask, at: 0)
    self.draftTitle = ""
  }
}
