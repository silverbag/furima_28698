import consumer from "./consumer"

consumer.subscriptions.create("MessageChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // console.log(data)
    const html = `<strong>${data.user}：${data.content.text}</strong>`;
    const messages = document.getElementById('messages');
    const newMessage = document.getElementById('message_text');
    messages.insertAdjacentHTML('afterbegin', html);
    // newMessage.insertAdjacentHTML('afterbegin', html);
    newMessage.value='';
  }
  
});
