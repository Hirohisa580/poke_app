
function showImage () {
  const image = document.getElementById("showImage")
  console.log(image)
  image.addEventListener("mouseover", () => {
    console.log("マウスオーバー")
  })
  image.addEventListener("mouseout", () => {
    console.log("マウスアウト")
  })
}

window.addEventListener("load", showImage)