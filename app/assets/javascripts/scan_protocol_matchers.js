// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

// TODO: remove jQuery dependency
document.addEventListener('turbolinks:load', () => {
  var tag_matchers = $('#value_type_matcher_id').html()

  function filterTags() {
    var scan_header_tag = $('#scan_header_tag_id :selected').text()
    var options = $(tag_matchers).filter(`optgroup[label="${scan_header_tag}"]`).html()
    if (options) {
      $('#value_type_matcher_id').html(options)
    } else {
      $('#value_type_matcher_id').empty()
    }
  }

  $('#scan_header_tag_id').change(filterTags)

  // filterTags()
})
