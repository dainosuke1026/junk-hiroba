function pulldown_menu() {
  const menuIcon = document.getElementById("open");
  const pullDownMenu = document.querySelector(".sp-menu > ul");
  menuIcon.addEventListener("click", () => {
    pullDownMenu.classList.toggle("active");
  });
}
window.addEventListener("load", pulldown_menu);