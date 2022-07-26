document.addEventListener('turbo:load', event => {
  const fileUploadElement = document.getElementById('property_photo');

  if(fileUploadElement) {
    fileUploadElement.addEventListener('change', event => {
      if (event.target.files.length > 0) {
        let src = URL.createObjectURL(event.target.files[0]);
        let preview = document.getElementById('preview');
        let defaultEl = document.getElementById('photo-default');

        preview.src = src;
        defaultEl.classList.add("hidden");
        preview.classList.remove("hidden");

      } else {
        console.log('Unable to attach photo');
      }
    })
  }

});
