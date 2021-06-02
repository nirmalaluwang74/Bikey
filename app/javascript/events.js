const wish = document.getElementByTagName('i');
romain.addEventListener("click", (event) => {
  console.log(event);
  event.currentTarget.classList.toggle('clicked');
});
