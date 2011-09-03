jQuery.ajaxSetup({
  'beforeSend': function(xhr) {xhr.setRequestHeader("Accept", "text/javascript")}
})

jQuery.fn.submitWithAjax = function() {
  this.submit(function() {
      $.post(this.action, $(this).serialize(), null, "script");
      return false;
      })
  return this;
};

// see create.js.erb
// $(document).ready(function() {
  // $("#search_anagrams").submitWithAjax();
// })

