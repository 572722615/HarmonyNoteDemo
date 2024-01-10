import { TaskModel } from '../model/TaskModel'

@Component
export struct AddPage {
  @Link displayAddPage: boolean
  @State taskContent: string = ''
  @Link taskList: Array<TaskModel>

  build() {
    Column() {
      Stack() {
        Column({ space: 20 }) {
          Image('images/back.png').width(30)
            .onClick(() => {
              this.displayAddPage = false
            })

        }.alignItems(HorizontalAlign.Start)
        .width('100%')

        Text('新增')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
      }


      TextArea({ text: this.taskContent, placeholder: '请输入清单内容 ' })
        .backgroundColor(Color.White)
        .width(300)
        .height(200)
        .borderRadius(10)
        .borderColor(0xc2bfbf)
        .margin({ top: 30, bottom: 20 })
        .onChange((value) => {
          this.taskContent = value
        })

      Button({ stateEffect: true, type: ButtonType.Normal }) {
        Text('确定').fontColor(Color.White)
      }
      .width(300)
      .height(50)
      .borderRadius(5)
      .onClick(() => {
        let task = new TaskModel({ taskContent: this.taskContent, isComp: false })

        //逆序
        this.taskList.splice(0, 0, task)
        this.displayAddPage = false
      })

    }.width('100%').height('100%')
    .backgroundColor(0xBED0DC)
    .padding(20)
  }
}