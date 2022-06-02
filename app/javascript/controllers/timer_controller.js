
import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "base-timer-label" ]

  connect() {
 // Called any time the controller is connected to the DOM
		console.log('Hello, from timer Stimulus controller!');

	startTimer();
  }

onTimesUp() {
  clearInterval(timerInterval);
}

startTimer() {
  timerInterval = setInterval(() => {
    timePassed = timePassed += 1;
    timeLeft = TIME_LIMIT - timePassed;
    this.baseTimerLabelTarget.innerHTML = formatTime(
      timeLeft
    );
    setCircleDasharray();
    setRemainingPathColor(timeLeft);

    if (timeLeft === 0) {
      onTimesUp();
    }
  }, 1000);
}

formatTime(time) {
  const minutes = Math.floor(time / 60);
  let seconds = time % 60;

  if (seconds < 10) {
    seconds = `0${seconds}`;
  }

  return `${minutes}:${seconds}`;
}



} // end of class
