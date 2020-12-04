function pulldown_menu() {
  const menuIcon = document.getElementById("open");
  const pullDownMenu = document.querySelector(".pulldown-content > ul");
  menuIcon.addEventListener("click", () => {
    pullDownMenu.classList.toggle("active");
  });
}
window.addEventListener("load", pulldown_menu);