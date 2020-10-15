$(function () {
  document.addEventListener("turbolinks:load", function () {

    //DataTransferオブジェクトで、データを格納する箱を作る
    let dataBox = new DataTransfer();
    //querySelectorでfile_fieldを取得
    let file_field = document.querySelector('input[type=file]')

    //fileが選択された時に発火するイベント
    $('#travel_image').change(function () {
      //選択したfileのオブジェクトをpropで取得
      let files = $('input[type="file"]').prop('files')[0];

      $.each(this.files, function (i, file) {
        //FileReaderのreadAsDataURLで指定したFileオブジェクトを読み込む
        let fileReader = new FileReader();
        //DataTransferオブジェクトに対して、fileを追加
        dataBox.items.add(file)
        //DataTransferオブジェクトに入ったfile一覧をfile_fieldの中に代入
        file_field.files = dataBox.files
        fileReader.readAsDataURL(file);

        //読み込みが完了すると、srcにfileのURLを格納
        fileReader.onloadend = function () {
          let src = fileReader.result
          let html = `
                      <div class='album-image'>
                        <img src=${src}  alt="画像">
                      </div>
                     `
          $('.FormField__PlanImage').append(html).children('label').remove()
        }
      })
    })

    //削除ボタンをクリックすると発火するイベント

  })
})
