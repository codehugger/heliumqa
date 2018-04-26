// This code uses:
//
// * babel-polyfill (https://babeljs.io/docs/usage/polyfill/)
// * whatwg-fetch (https://github.github.io/fetch/)
// * uppy (https://uppy.io)
function fileUpload(fileInput) {
  var filePresignCount = 0;
  var fileUploadCount = 0;

  fileInput.classList.add('uppy-Loaded')
  fileInput.style.display = 'none'

  var presignPath = fileInput.dataset.presignPath;
  var successPath = fileInput.dataset.successPath;

  var uppy = Uppy.Core({
    autoProceed:         true,
    debug:               true,
    id:                  fileInput.id,
    thumbnailGeneration: false
  })
  .use(Uppy.DragDrop, {
    target:             fileInput.parentNode,
    width:              '100%',
    height:             '100%',
    note:               '',
    locale: {
      strings: {
        dropHereOr: 'Drop files here or',
        browse: 'browse'
      }
    }
  })
  //.use(Uppy.StatusBar, { target: fileInput.parentNode, hideAfterFinish: false })
  .use(Uppy.AwsS3, {
    limit: 5,
    getUploadParameters: function (file) {
      // Shrine's presign endpoint
      return fetch(presignPath + '?filename=' + file.name)
      .then((response) => {
        $('#progressBar').show()
        filePresignCount += 1;
        fileUploadCount = filePresignCount;
        return response.json()
      })
    }
  })

  uppy.run()

  $(fileInput.parentNode).append(`
    <div id="progressBar" hidden>
      <div class="progress progress progress-striped active">
        <div class="progress-bar" style="width: 100%"></div>
      </div>
      <div class="m-t-sm small">Presigning files ... <strong>Please don't refresh the page.</strong></div>
    </div>
  `)

  uppy.on('upload-success', function (fileId, data) {
    var file = uppy.getFile(fileId)

    // construct uploaded file data in the format that Shrine expects
    var uploadedFileData = {
      id: file.meta['key'].match(/^cache\/(.+)/)[1], // remove the Shrine storage prefix
      storage: 'cache',
      metadata: {
        size:      file.size,
        filename:  file.name,
        mime_type: file.type,
      }
    }

    axios.post(successPath, { qa_session_file: { file: uploadedFileData } }, { responseType: 'json' })
    .then(function (response) {
      fileUploadCount -= 1;
      console.log(filePresignCount, fileUploadCount);
      $('#progressBar').html(`
        <div class="progress progress">
          <div class="progress-bar" style="width: ${100-((fileUploadCount*1.0)/(filePresignCount*1.0))*100}%"></div>
        </div>
        <div class="m-t-sm small">Uploading files. <strong>Please don't refresh the page.</strong></div>
      `)
      if (fileUploadCount <= 0) {
        setTimeout(window.location.reload.bind(window.location), 5000);
      }
    })
    .catch(function (error) {
      console.log(error);
    });
  })
}

document.addEventListener('turbolinks:load', () => {
  document.querySelectorAll('input[type=file]').forEach(function (fileInput) {
    if (fileInput.multiple &&
      !fileInput.classList.contains("uppy-DragDrop-input") &&
      !fileInput.classList.contains("uppy-Loaded")) {
      fileUpload(fileInput);
    }
  })
})
