import { data } from "jquery";
import consumer from "./consumer"

const appMessage = consumer.subscriptions.create("MessageChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const messages = document.getElementById('messages');
    messages.insertAdjacentHTML('beforeEnd', data['message']);
  },

  speak: function(message, data_user, data_tutor) {
    return this.perform('speak', {message: message, user_id: data_user, tutor_id: data_tutor});
  }
});
window.addEventListener("load", function() {
  const input = document.getElementById("message_input")
  if (input != "") {
    const data_user = input.getAttribute("data_user")
    const data_tutor =  input.getAttribute("data_tutor")
    const button = document.getElementById("message_button")
    button.addEventListener("click", function(e) {
      const content = input.value
        appMessage.speak(content, data_user, data_tutor);
        input.value = '';
        e.preventDefault();
    })
  }
})
