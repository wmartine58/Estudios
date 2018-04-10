

// function init() {
//     var btn = document.querySelector('.comment-input button');
//     btn.addEventListener('click', addCommet);
// }
//
// function addCommet() {
//     var txtInput = document.querySelector('.comment-input input');
//     if (txtInput.value != "") {
//         var newComment = document.createElement('p');
//         newComment.textContent = txtInput.value;
//         var commetSection = document.querySelector(".comments")
//         commetSection.appendChild(newComment);
//         txtInput.value = "";
//     }
// }
// init();


function addComment(){
    var txtInput = $('.comment-input input');
    if (txtInput.val() != "") {
        var newComment = $("<p></p>").text(txtInput.val());
        $(".comments").append(newComment);
        txtInput.val("");
    }
}


$(document).ready(function(){
    $(".comment-input button").click(function() {
        addComment();
    });
    $(".comment-input input").keypress(function(){
        if (event.keyCode==13) {
            addComment();
        }
    });
});
