import consumer from "./consumer"

consumer.subscriptions.create("MessageChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // console.log("111")
    const html = `
    <div class="message-text">
      <p>${data.content.text}</p>
      <br>
      <p>${data.content.created_at}</p>
    </div>
    `;

    const messages = document.getElementById('messages');
    const newMessage = document.getElementById('comment-text');
    messages.insertAdjacentHTML('afterbegin', html);
    newMessage.value='';
  }
});
