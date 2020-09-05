$(function () {

  $(".profile--icon").on("click", function () {
    $(".ModalActive").show()
  })
  $(".close").on("click", function () {
    $(".ModalActive").hide()
  })

  $(".AlbumCreate").on("click", function () {
    $(".ModalActive").show()
  })


  //背景をクリックしたときにモーダルが隠れる記述
  $(".modal_bg").on("click", function () {
    $(".ModalActive").hide()
  })
  //背景をクリックしたときに入力内容がリセットされる
  $('.modal_bg').on('click', function () {
    $('form')[0].reset();
  });

})
