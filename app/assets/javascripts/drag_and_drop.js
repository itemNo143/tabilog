$(function () {
  document.addEventListener("turbolinks:load", function () {
    //HTML自体にドラッグ＆ドロップしても何もしないようにする
    $(document).on('dragenter', function (e) {
      e.stopPropagation();
      e.preventDefault();
    });
    $(document).on('dragover', function (e) {
      e.stopPropagation();
      e.preventDefault();
    });
    $(document).on('drop', function (e) {
      e.stopPropagation();
      e.preventDefault();
    });

    // ドロップ可能エリアに入った時
    $('#js-dropzone').on('dragenter', function (e) {
      e.preventDefault();
      e.stopPropagation();
      $('#js-overlay-area').show()
    })

    $('#js-overlay-area').on('dragleave', function (e) {
      // ドロップ可能エリアを出た時
      e.preventDefault();
      e.stopPropagation();
      $('#js-overlay-area').hide()
    }).on('dragover', function (e) {
      // ドロップ可能エリアにカーソルがある時
      e.preventDefault();
      e.stopPropagation();
    }).on('drop', function (e) {
      // ドロップしたとき
      e.preventDefault();
      e.stopPropagation();
      $('#js-overlay-area').hide()
      //fileを取得
      $(e.target).find('[type="file"]').get()[0].files = e.originalEvent.dataTransfer.files;
      $(this).closest('form').trigger('submit');
    })


    $('#js-drop-area').on('dragover', function (e) {
      e.preventDefault();
      e.stopPropagation();
    }).on('drop', function (e) {
      e.preventDefault();
      e.stopPropagation();
      $(this).find('[type="file"]').get()[0].files = e.originalEvent.dataTransfer.files;
      $('#travel_image').change()
    })

  })
})
