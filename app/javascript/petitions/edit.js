description_input = document.getElementById('petition_description');
file_button = document.getElementById('picture_button');
file_input = document.getElementById('file_input');
update_button = document.getElementById('update_petition');

description_input.addEventListener('input', description_oninput)
file_input.addEventListener('change', picture_onchange)

function description_oninput() {
    refresh();
}

function picture_onchange() {
    if (file_input.files.item(0) != null) {
        file_button.innerHTML = file_input.files.item(0).name;
    }
}

function refresh() {
    valid_description = description_input.value.length > 0;
    if (valid_description) {
        update_button.disabled = false;
        update_button.classList.add("button");
        update_button.classList.remove("button_disabled");
    } else {
        update_button.disabled = true;
        update_button.classList.add("button_disabled");
        update_button.classList.remove("button");
    }
}

refresh();