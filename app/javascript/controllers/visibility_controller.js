import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["hideable", "hideablesp"]

  connect() {
    console.log("Hello")
    console.log(this.element)
  }

  showTargets() {
    this.hideableTargets.forEach(el => {
      el.disabled = false
    });
  }

  hideTargets() {
    this.hideableTargets.forEach(el => {
      el.hidden = true
      el.disabled = true
    });
  }

  toggleTargets() {
    this.hideableTargets.forEach((el) => {
      el.disabled = !el.disabled
    });
  }



}
