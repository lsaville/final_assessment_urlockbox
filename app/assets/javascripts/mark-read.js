var $newLinkTitle, $newLinkUrl;

$(document).ready(function(){
  $('#links-list').on('click', 'button.mark-read', markAsRead)
})

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
}

function displayFailure(failureData){
  console.log("FAILED attempt to update Link: " + failureData.responseText);
}
