function message() {
  const submit = document.getElementById("submit");
  submit.addEventListener("click", (e) => {

    const formData = new FormData(document.getElementById("form"));
    // console.log(formData);
    const XHR = new XMLHttpRequest();
    XHR.open("POST", `messages`, true);
    XHR.responseType = "json";
    XHR.send(formData);
    XHR.onload = () => {

      if (XHR.status != 200) {
        alert(`Error ${XHR.status}: ${XHR.statusText}`);
        return null;
      }

      const item = XHR.response.message;
      const list = document.getElementById("list");
      const formText = document.getElementById("content");

      const user = document.querySelector(".message-user")
      const userNickname = user.getAttribute("data-nickname");
      // console.log(userNickname);

      const HTML = `
      <div class="message">
        <div class="upper-message">
          <div class="message-user" data-nickname=${userNickname}>
          ${userNickname}
          </div>
          <div class="message-date">
          ${item.created_at}
          </div>
        </div>
      <div class="lower-message">
        <div class="message-content">
        ${item.content}
        </div>
        <%= image_tag message.image.variant(resize:'750x750'), class:"message-image" if message.image.attached? %>
        </div>
      </div>
      <br>`;
      
      list.insertAdjacentHTML("beforebegin", HTML);
      formText.value = "";
    };
    e.preventDefault();
  });
}
window.addEventListener("load", message);