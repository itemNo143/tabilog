$(function () {
  //turbolinksとは、ページ遷移をAjaxに置き換え、JavaScriptやCSSのパース(解析・変換)を省略することで高速化するgemで、Rails4からはデフォルトで使用されています。
  //document.addEventListener("turbolinks:load")を入れることによって、turbolinksを無効化できます！！
  document.addEventListener("turbolinks:load", function () {

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
})
