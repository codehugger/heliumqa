// This code uses:
//
// * babel-polyfill (https://babeljs.io/docs/usage/polyfill/)
// * whatwg-fetch (https://github.github.io/fetch/)
// * uppy (https://uppy.io)

function fileUpload(fileInput) {
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
  .use(Uppy.StatusBar, { target: fileInput.parentNode, hideAfterFinish: false })
  .use(Uppy.AwsS3, {
    getUploadParameters: function (file) {
      return fetch(presignPath + '?filename=' + file.name) // Shrine's presign endpoint
      .then(function (response) { return response.json() })
    }
  })

  uppy.run()

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

    axios.post(successPath, { inspection_file: { file: uploadedFileData } })
    .then(function (response) {
      console.log(response);
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
