import consumer from "./consumer"

consumer.subscriptions.create("CommentChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const html = `<li class="comments-list" id="comments-list">
                    <div class="comment-user">
                      ${data.comment[1].nickname}
                    </div>
                    <div class="commnt-content">
                      ${data.comment[0].content}
                    </div>
                  </li>`;
    const message = document.getElementById('comments-area');
    message.insertAdjacentHTML('afterbegin'', html);
    document.getElementById('comment-text').value = "";
  }
});