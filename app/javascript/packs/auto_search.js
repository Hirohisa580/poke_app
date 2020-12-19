function search() {
  const num = document.getElementById("number")
  if(num.value < 899) {
    document.getElementById("pokemonGet").click();
  }
}
window.addEventListener("load", search);