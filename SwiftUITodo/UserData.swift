//
//  UserData.swift
//  SwiftUITodo
//
//  Created by Suyeol Jeon on 03/06/2019.
//  Copyright © 2019 Suyeol Jeon. All rights reserved.
//

import Combine
import SwiftUI

private let defaultTasks: [Task] = [
  Task(title: "Read SwiftUI Documentation 📚", isDone: false),
  Task(title: "Watch WWDC19 Keynote 🎉", isDone: true),
]

final class UserData: BindableObject {
  let didChange = PassthroughSubject<UserData, Never>()

  var tasks: [Task] = defaultTasks {
    didSet {
      self.didChange.send(self)
    }
  }
}
