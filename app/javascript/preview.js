function preview() {
  const file = document.getElementById('item-image');

  if (document.URL.match(/items\/new/)) {
    file.addEventListener('change', (e) => {
      const previewImg = document.getElementById('item-preview-image');
      if (previewImg) {
        previewImg.remove();
      }

      const file = e.target.files[0];
      const blob = window.URL.createObjectURL(file);
      const HTML = `<img src=${blob} class='item-img' id='item-preview-image'>`;

      const previewArea = document.getElementById('image-preview-area');
      previewArea.insertAdjacentHTML('afterbegin', HTML);
    });
  }
}

window.addEventListener('load', preview);