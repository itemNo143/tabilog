$(function () {
  //turbolinksとは、ページ遷移をAjaxに置き換え、JavaScriptやCSSのパース(解析・変換)を省略することで高速化するgemで、Rails4からはデフォルトで使用されています。
  //document.addEventListener("turbolinks:load")を入れることによって、turbolinksを無効化できます！！
  document.addEventListener("turbolinks:load", function () {

    $(".pencil_icon").on("click", function () {
      $(".ModalActive").show()
    })
    $(".close").on("click", function () {
      $(".ModalActive").hide()
      $(".ModalActiveAttention").hide()
    })

    $(".ModalTrigger").on("click", function () {
      $(".ModalActive").show()
    })

    $(".delete_button").on("click", function () {
      $(".ModalActiveAttention").show()
    })


    //背景をクリックしたときにモーダルが隠れる記述
    $(".modal_bg").on("click", function () {
      $(".ModalActive").hide()
      $(".ModalActiveAttention").hide()
    })
    //背景をクリックしたときに入力内容がリセットされる
    $('.modal_bg').on('click', function () {
      $('form')[0].reset();
    });

  })
})
