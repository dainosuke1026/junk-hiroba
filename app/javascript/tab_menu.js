function tab_menu() {
  const tabItems = document.querySelectorAll('.tab-menu li a');
  const tabContents = document.querySelectorAll('.tab-content');

  tabItems.forEach(clickedItem => {
    clickedItem.addEventListener('click', () => {

      tabItems.forEach(item => {
        item.classList.remove('active');
      });
      clickedItem.classList.add('active');

      tabContents.forEach(content => {
        content.classList.remove('active');
      });
      document.getElementById(clickedItem.dataset.id).classList.add('active');
    });
  });
}
window.addEventListener("load", tab_menu);