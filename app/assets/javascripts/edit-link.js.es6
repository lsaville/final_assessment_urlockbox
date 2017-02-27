var $linkId;
var $editLinkTitle;
var $editLinkUrl;
var $userId;

$(document).ready(function(){
  $('#links-list').on('click', 'button.edit-link', function(){
    window.location = `/links/${this.id}/edit`;
  })

  $linkId = $('#user-data').data('urlid');
  $editLinkTitle = $('#link-title');
  $editLinkUrl = $('#link-url');

  $('#edit-link').on('submit', updateLink);
})

function updateLink (event) {
  event.preventDefault();

  console.log('winning');

  var link = getEditData();

  $.ajax({
    url: '/api/v1/links/' + $linkId,
    method: 'PATCH',
    data: link
  })
   .done( redirectToLinks )
   .fail( displayEditFailure )
}

function getEditData() {
  return {
    id: $('#user-data').data('urlid'),
    title: $('#link-title').val(),
    url: $('#link-url').val()
  }
}

function redirectToLinks() {
  window.location = `/links`
}

function displayEditFailure(failureData){
  var error = JSON.parse(failureData.responseText)[0]
  $('#edit-link').append(`<p>FAILED attempt to create new Link: ${error}</p>`);
}
