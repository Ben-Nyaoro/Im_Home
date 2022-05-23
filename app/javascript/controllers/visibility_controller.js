import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["starting", "destination", "startingsafe", "destisafe"]

  connect() {
    console.log("Hello")
    console.log(this.startingsafeTarget.children[0].lastChild)

  }

  showTargetsStart() {
    this.startingsafeTarget.children[0].lastChild.disabled = true
    this.startingsafeTarget.hidden = true
    if(this.startingTarget.children[0].lastChild != null) {
      this.startingTarget.children[0].lastChild.disabled = false
    }
    this.startingTarget.hidden = false

    };

    showTargetsDesti() {
      this.destisafeTarget.children[0].lastChild.disabled = true
      this.destisafeTarget.hidden = true
      if (this.destinationTarget.children[0].lastChild != null) {
        this.destinationTarget.children[0].lastChild.disabled = false
      }
      this.destinationTarget.hidden = false

      };


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
