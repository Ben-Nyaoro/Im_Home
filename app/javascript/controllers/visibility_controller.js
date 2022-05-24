import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["starting", "destination", "startingsafe", "destisafe"]

  toggleTargetsStart() {
    let startingSafe = this.startingsafeTarget.children[0].lastChild
    if(startingSafe != null) {
      startingSafe.disabled = !startingSafe.disabled
    };
    this.startingsafeTarget.hidden = !(this.startingsafeTarget.hidden)
    const startingForm = this.startingTarget.children
    this.startingTarget.hidden = !(this.startingTarget.hidden)
    if(startingForm != null) {
      startingForm[0].disabled = !startingForm[0].disabled
      startingForm[1].disabled = !startingForm[1].disabled
      startingForm[2].disabled = !startingForm[2].disabled
      startingForm[3].disabled = !startingForm[3].disabled
      }
    };


  toggleTargetsDesti() {
    let destiSafe = this.destisafeTarget.children[0].lastChild
    if (destiSafe != null) {
    destiSafe.disabled = !destiSafe.disabled
    };
    this.destisafeTarget.hidden = !(this.destisafeTarget.hidden)
    const destiForm = this.destinationTarget.children
    this.destinationTarget.hidden = !(this.destinationTarget.hidden)
    if(destiForm != null) {
      destiForm[0].disabled = !destiForm[0].disabled
      destiForm[1].disabled = !destiForm[1].disabled
      destiForm[2].disabled = !destiForm[2].disabled
      destiForm[3].disabled = !destiForm[3].disabled
    }
    };

      // connect() {
  //   console.log(this.startingTarget.children)
  // };

  // showTargetsStart() {
  //   this.startingsafeTarget.children[0].lastChild.disabled = true
  //   this.startingsafeTarget.hidden = true
  //   if(this.startingTarget.children[0].lastChild != null) {
  //     (this.startingTarget.children).forEach((element) => {
  //       element.disabled = false
  //     });
  //     };
  //   this.startingTarget.hidden = false
  //   };

  // showTargetsDesti() {
  //   this.destisafeTarget.children[0].lastChild.disabled = true
  //   this.destisafeTarget.hidden = true
  //   if (this.destinationTarget.children[0].lastChild != null) {
  //     this.destinationTarget.children[0].lastChild.disabled = false
  //   };
  //   this.destinationTarget.hidden = false

  //   };

}
