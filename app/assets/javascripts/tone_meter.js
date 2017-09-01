$(document).ready(function () {
  // will call refreshPartial every 3 seconds
  setInterval(refreshPartial, 3000)
});
function refreshPartial() {
  $.ajax({
    url: "http://localhost:3000/refresh_part"
  })
}
// calls action refreshing the partial

