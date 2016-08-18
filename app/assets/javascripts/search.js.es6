$(document).ready(() => {
  $("#searchIdea").on("keyup", e => {

    let query = e.target.value
    let ideas = $("#table-body").children('tr')

    ideas.hide()

    let matches = ideas.filter(function(index, idea) {
      return $(idea).children('.input')
        .text().toLowerCase().includes(query)
    })
    matches.show()
  })
})
