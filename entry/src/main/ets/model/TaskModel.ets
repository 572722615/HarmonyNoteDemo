export class TaskModel {
  taskContent: string = ''
  isComp: boolean = false

  constructor({taskContent:taskContent, isComp:isComp}) {
    this.taskContent = taskContent
    this.isComp = isComp
  }
}