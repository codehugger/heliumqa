import { Controller } from "stimulus"

export default class extends Controller {
  initialize() {
    this.nameElement.value = this.name || ""
  }

  log(event) {
    console.log(this.nameElement.value)
  }

  get nameElement() {
    return this.targets.find("name")
  }
}
