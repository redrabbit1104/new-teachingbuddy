function board() {
  const submit = document.querySelector(".submit_comment");
  if (!submit) {
    return false;
  }
  submit.addEventListener("click", (e) => {
    const formData = new FormData(document.querySelector(".comment_form"));
    const url = "/boards";
    const post_options = {
      method: "post",
      body: formData,
    };
    fetch(url, post_options)
      .then((response) => {
        if (!response.ok) {
          console.log(`Error ${reponse.status}: ${reponse.statusText}`);
          return null;
        } else {
          return response.json();
        }
      })
      .then((item) => {
        const list = document.getElementById("list");
        const formText = document.querySelector(".input_comment");
        const HTML = `
                    <td class="post">${item.board.user_id}</td>
                    <td class="post-date">${item.board.created_at}</td>
                    <td class="post-content">${item.board.post}</td>
                    <td></td>
                    <td></td>
                    `;
        list.insertAdjacentHTML("afterend", HTML);
        formText.value = " ";
      });
    e.preventDefault();
  });
}

window.addEventListener("load", board);
