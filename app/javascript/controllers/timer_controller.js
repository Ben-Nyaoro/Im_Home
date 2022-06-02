
import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "" ]

  connect() {
 // Called any time the controller is connected to the DOM
		console.log('Hello, from timer Stimulus controller!');
  }



}
