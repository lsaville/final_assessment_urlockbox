var $newLinkTitle, $newLinkUrl;

$(document).ready(function(){
  $('#links-list').on('click', 'button.mark-read', markAsRead)
  $('#links-list').on('click', 'button.mark-unread', markAsUnRead)
})

function markAsUnRead(e){
  e.preventDefault()

  var $this = $(this);
  var linkId = $this.parents('.link').data('id');
  var linkUrl = $this.parents('.link').data('url');

  $.ajax({
    url: '/api/v1/links/' + linkId,
    method: 'PATCH',
    data: {read: false}
  })
   .then(updateLinkStatus)
   .fail(displayFailure);
}

function markAsRead(e) {
  e.preventDefault();

  var $this = $(this);
  var linkId = $this.parents('.link').data('id');
  var linkUrl = $this.parents('.link').data('url');

  $.ajax({
    url: '/api/v1/links/' + linkId,
    method: 'PATCH',
    data: {read: true}
  })
   .then(updateLinkStatus)
   .fail(displayFailure);

  $.ajax({
    type: "POST",
    url: 'http://localhost:8080/api/v1/reads',
    data: {read: linkUrl},
  })
}

function updateLinkStatus(link) {
  $(`.link[data-id=${link.id}]`).find(".link-read").text(link.read);
  if (link.read == true) {
    $(`.link[data-id=${link.id}]`).addClass("true")
  } else {
    $(`.link[data-id=${link.id}]`).removeClass("true")
  }
}

function displayFailure(failureData){
  console.log("FAILED attempt to update Link: " + failureData.responseText);
}
