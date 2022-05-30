import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "past", "current", "p", "c" ]

  connect() {
 // Called any time the controller is connected to the DOM
		console.log('Hello, from Stimulus  filter controller!');
		this.currentTarget.classList.add("d-none")
  }

  disconnect() {
    // Called any time the controller is disconnected from the DOM
		console.log('I am disconnected! from filter controller');
  }

	pastJourney() {
	this.pastTarget.classList.remove("d-none");
	this.currentTarget.classList.add("d-none");
	this.cTarget.classList.remove("active");
	this.pTarget.classList.add("active");
	}

	currentJourney() {
	this.pastTarget.classList.add("d-none")
	this.currentTarget.classList.remove("d-none")
	this.pTarget.classList.remove("active");
	this.cTarget.classList.add("active");
	}

}
