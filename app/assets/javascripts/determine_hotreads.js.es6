var hottestReads;
var userLinks;

$(document).ready(function(){
  $.ajax({
    url: 'http://localhost:8080/api/v1/hotreads',
    method: 'GET'
  })
    .done( addHotnessToReads )
    .fail( itDidntWork )
})

function addHotnessToReads(reads) {
  userLinks = $('.link');
  userLinks.each(function() {
    checkLinks(reads, $(this));
  })
}

function checkLinks(reads, link) {
  for (var i = 0; i < reads.length; i++) {
    var url = link.data('url');
    if (url === reads[i].url && i === 0) {
      topLink(link);
    } else if (url === reads[i].url) {
      hotLink(link);
    }
  }
}

function topLink(link){
  link.prepend("<p class='top'>Top Link!!!</p>");
}

function hotLink(link){
  link.prepend("<p class='hot'>Hot</p>");
}

function itDidntWork() {
  console.log("didntwork");
}
