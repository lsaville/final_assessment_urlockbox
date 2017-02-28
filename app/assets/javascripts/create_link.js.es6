var $newLinkTitle, $newLinkUrl, $userId;

$(document).ready(function(){
  $newLinkTitle = $("#link-title");
  $newLinkUrl   = $("#link-url");
  $userId       = $("#user-data").data('id');

  $("#new-link").on('submit', createLink);
})

function createLink (event){
  event.preventDefault();

  console.log("win")

  var link = getLinkData();

  $.post("/api/v1/links", link)
   .then( renderLink )
   .fail( displayNewFailure )
 }

function getLinkData() {
 return {
   title: $newLinkTitle.val(),
   url: $newLinkUrl.val(),
   user_id: $userId
 }
}

function renderLink(link){
  $("#links-list").append( linkHTML(link) )
  clearLink();
}

function linkHTML(link) {

    return `<div class='link' data-id='${link.id}' data-url='${link.url}' id="link-${link.id}">
              <p class='link-title'>${ link.title }</p>
              <p class='link-url'>${ link.url }</p>

              <p class="link_read">
                ${ link.read }
              </p>
              <p class="link_buttons">
                <button class="mark-read">Mark as Read</button>
                <button id='${link.id}' class='edit-link'>Edit</button>
                <button class='delete-link'>Delete</button>
              </p>
            </div>`
}

function clearLink() {
  $newLinkTitle.val("");
  $newLinkUrl.val("");
}

function displayNewFailure(failureData){
  var error = JSON.parse(failureData.responseText)[0]
  $('#new-link').append(`<p>FAILED attempt to create new Link: ${error}</p>`);
}
