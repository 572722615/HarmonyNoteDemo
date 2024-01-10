import { TaskModel } from '../model/TaskModel'

@Component
export struct ListPage {
  @Link displayAddPage: boolean
  @Link taskList: Array<TaskModel>

  build() {
    Column({ space: 20 }) {
      Text('我的任务').fontSize(20)
        .fontWeight(FontWeight.Bold)

      Stack() {
        Image('images/bg.png').width(300)
          .height(560)

        Column({ space: 10 }) {

          ForEach(this.taskList, (item: TaskModel, index) => {
            Row() {

              Checkbox().select(item.isComp)
                .onChange((value) => {
                  let oldTask = this.taskList[index]
                  let newTask = new TaskModel({
                    taskContent:oldTask.taskContent,
                    isComp : value
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

              Blank()
              Image('images/delete.png').width(20)
                .onClick(() => {
                  this.taskList.splice(index, 1)
                })
            }.width('70%')
          })


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