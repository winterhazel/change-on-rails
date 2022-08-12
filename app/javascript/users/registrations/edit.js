file_button = document.getElementById('picture_button');
file_input = document.getElementById('file_input');

file_input.addEventListener('change', picture_onchange)

function picture_onchange() {
    if (file_input.files.item(0) != null) {
        file_button.innerHTML = file_input.files.item(0).name;
    }
}