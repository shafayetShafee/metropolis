/* 
code modified from https://github.com/mkordulewski/reveal.js-fullscreen-code/blob/master/reveal.js-fullscreen-code.js
*/

/**
 * code-fullscreen
 * A filter that add a fullscreen button in code chunk.
 * 
 * MIT License
 * Copyright (c) 2023 Shafayet Khan Shafee.
 */

function fullscreen_code() {
  // creating the fullscreen box
  $('body').append("<div id='fullscreen-box'><pre class='sourceCode numberSource number-lines'><code class='sourceCode'></code></pre></div>" );
  
  // for revealjs do not link the button
  if ($('div.reveal').length) {
    $('pre code').before("<button title='Fullscreen' class='fullscreen-button'><i class='fullscreen-icon'></i></button>");
    $('div#fullscreen-box button.fullscreen-button').replaceWith("<button title='Exit Fullscreen' class='fullscreen-button'><i class='fullscreen-exit-icon'></i></button>")
  } else {
    // create buttons with links
    $('pre code').before("<button title='Fullscreen' class='fullscreen-button'><a href='#fullscreen-box'><i class='fullscreen-icon'></a></i></button>");
    $('div#fullscreen-box button.fullscreen-button').replaceWith("<button title='Exit Fullscreen' class='fullscreen-button'><a href='#'><i class='fullscreen-exit-icon'></i></a></button>")
  }
  
  var fullscreenBoxVisible = false;
  $('button.fullscreen-button').click(function(e){
      var code = this.parentElement.children[1].innerHTML;
      if (fullscreenBoxVisible) {
          $('div#fullscreen-box pre code').html('');
          $('div#fullscreen-box').toggleClass('visible');
          fullscreenBoxVisible = false;
      } else {
          $('div#fullscreen-box pre code').html(code);
          $('div#fullscreen-box').toggleClass('visible');
          fullscreenBoxVisible = true;
          var box_height = Math.max($('div#fullscreen-box pre').outerHeight(), $(document).height());
          $('div#fullscreen-box pre').height(box_height);
          $('div#fullscreen-box').height(box_height);
          // attach links for html (not revealjs)
          if (!$('div.reveal').length) {
            let id = this.parentElement.parentElement.id;
            let id_string = `#${id}`;
            $('div#fullscreen-box button.fullscreen-button a').attr("href", id_string); 
          };
      };
    // slow the link changing
    if (!$('div.reveal').length) {
       setTimeout(function() {
         if (!fullscreenBoxVisible) {
           $('div#fullscreen-box button.fullscreen-button a').attr("href", "#fullscreen-box");
         }
       }, 100);
    };
  });
};

window.addEventListener("load", (event) => {
  fullscreen_code();
});
