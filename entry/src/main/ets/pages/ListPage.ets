import { TaskModel } from '../model/TaskModel'

@Component
export struct ListPage {
  @Link displayAddPage: boolean
  @Link taskList: Array<TaskModel>
  @State taskType: string = 'all'

  getTaskList(): Array<TaskModel> {
    if (this.taskType == 'all') {
      return this.taskList
    } else if (this.taskType == 'todo') {
      return this.taskList.filter((item) => {
        if(!item.isComp){
          return true
        }
      })
    }else if(this.taskType == 'done') {
      return this.taskList.filter((item) => {
        if(item.isComp){
          return true
        }
      })
    }
  }

  deleteTask(index: number) {
    AlertDialog.show({
      title: '删除任务',
      message: '二次确认',
      autoCancel: true,
      alignment: DialogAlignment.Bottom,
      offset: {
        dx: 0, dy: -400
      },
      secondaryButton: {
        value: '是',
        action: () => {
          this.taskList.splice(index, 1)

        }
      },
      primaryButton: {
        value: '否',
        action: () => {
          this.taskList.splice(index, 1)

        }
      }
    })
  }

  build() {
    Column({ space: 15 }) {
      Text('我的任务').fontSize(20)
        .fontWeight(FontWeight.Bold)
      Row() {
        Column() {
          Text('全部')
          Radio({ value: 'all', group: 'type' })
            .onChange((isSelect) => {
              if (isSelect) {
                this.taskType = 'all'
              }
            })
            .checked(this.taskType == 'all' ? true : false)

        }

        Column() {
          Text('待办')
          Radio({ value: 'todo', group: 'type' })
            .onChange((isSelect) => {
              if (isSelect) {
                this.taskType = 'todo'
              }
            })
            .checked(this.taskType == 'todo' ? true : false)

        }

        Column() {
          Text('完成')
          Radio({ value: 'done', group: 'type' })
            .onChange((isSelect) => {
              if (isSelect) {
                this.taskType = 'done'
              }
            })
            .checked(this.taskType == 'done' ? true : false)
        }
      }.width('70%').justifyContent(FlexAlign.SpaceAround)

      Stack() {
        Image('images/bg.png').width(300)
          .height(560)

        Column({ space: 10 }) {


          List() {
            ForEach(this.getTaskList(), (item: TaskModel, index) => {
              ListItem() {
                Row() {

                  Checkbox().select(item.isComp)
                    .onChange((value) => {
                      let oldTask = this.taskList[index]
                      let newTask = new TaskModel({
                        taskContent: oldTask.taskContent,
                        isComp: value
                      })
                      this.taskList[index] = newTask
                    })


                  Text(item.taskContent)
                    .margin({ left: 10 })
                    .decoration({
                      type: item.isComp ?
                      TextDecorationType.LineThrough :
                      TextDecorationType.None
                    })
                    .width('70%')
                    .maxLines(1)
                    .textOverflow({ overflow: TextOverflow.Ellipsis })


                  Blank()
                  Image('images/delete.png').width(20)
                    .onClick(() => {
                      this.deleteTask(index)
                    })
                }.width('100%')

              }
            })
          }.width('70%').height(300)

        }
        .margin({ top: 70 })

      }.alignContent(Alignment.Top)

      Column() {
        Button({ type: ButtonType.Circle,
          stateEffect: true }) {
          Text('+').fontColor(Color.White)
            .fontSize(50)
        }.width(60).height(60)
        .onClick(() => {
          this.displayAddPage = true
        })
      }.width('100%')
      .alignItems(HorizontalAlign.End)

    }.width('100%').height('100%')
    .backgroundColor(0xBED0DC)
    .padding({ top: 50, left: 20,
      right: 20, bottom: 20 })
  }
}