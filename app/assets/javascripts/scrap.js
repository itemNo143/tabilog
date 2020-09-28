$(function () {
  function buildPost(scrap) {
    return `
            <div class="ScrapImage" data-scrap-id=${scrap.id}>
              <a data-lightbox="group" href="${scrap.image}" created_at = "${scrap.created_at}">
                <img src="${scrap.image}" alt="写真">
              </a>
            </div>
           `
  }

  $('#ScrapForm').on('submit', function (e) {
    e.preventDefault();
    let formData = new FormData(this)
    let url = $(this).attr('action')
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
      .done(function (data) {
        let html = buildPost(data)
        $(".scrap").append(html)
        $(".scrap").animate({scrollTop: $(".scrap")[0].scrollHeight})
        $("form")[0].reset()
      })
      .fail(function () {
        alert("画像の送信に失敗しました")
      })
  })
})
