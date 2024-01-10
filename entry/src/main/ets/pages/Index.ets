import { TaskModel } from '../model/TaskModel'
import { AddPage } from './AddPage'
import { ListPage } from './ListPage'

@Entry
@Component
struct Index {
  @State displayAddPage: boolean = false
  @State taskList: Array<TaskModel> = [
  // new TaskModel({ taskContent: '第一天', isComp: false }),
  // new TaskModel({ taskContent: '第2天', isComp: true }),
  // new TaskModel({ taskContent: '第3天', isComp: false })

  ]

  build() {
    if (this.displayAddPage) {
      AddPage({ displayAddPage: $displayAddPage, taskList: $taskList })
    } else {
      ListPage({ displayAddPage: $displayAddPage, taskList: $taskList })
    }
  }
}