// Visit The Stimulus Handbook for more details 
// https://stimulusjs.org/handbook/introduction
// 
// This example controller works with specially annotated HTML like:
//
// <div data-controller="hello">
//   <h1 data-target="hello.output"></h1>
// </div>

import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "output" ]
  initialize() {
    // Called once, when the controller is first instantiated
		console.log('I am the initializer');
  }
  connect() {
 // Called any time the controller is connected to the DOM
    this.outputTarget.textContent = 'Hello, Stimulus!'
		console.log('Hello, Stimulus!');
  }

  disconnect() {
    // Called any time the controller is disconnected from the DOM
		console.log('I am disconnected!');
  }
}
