stage = 0;
page_title = document.getElementById("page_title");
page_description = document.getElementById("page_description");
form_label = document.getElementById("form_label");
remaining_characters_span = document.getElementById("remaining_characters");
title_input = document.getElementById("petition_title");
continue_button = document.getElementById("continue_button");
title_tips = document.getElementById("title_tips");
description_input = document.getElementById("petition_description");
description_tips = document.getElementById("description_tips");
image_box = document.getElementById("image_input");
file_button = document.getElementById("file_button");
file_input = document.getElementById("file");
photo_tips = document.getElementById("photo_tips");
back_button = document.getElementById("back_button");
submit_button = document.getElementById("create_petition");

function petition_oninput(e) {
    switch (e.id) {
        case "petition_title":
            let remaining_characters = 90 - title_input.value.length;
            remaining_characters_span.innerHTML = remaining_characters;
            if (remaining_characters < 90 && remaining_characters >= 0) {
                continue_button.disabled = false;
                continue_button.classList.add("button");
                continue_button.classList.remove("button_disabled");
            } else {
                continue_button.disabled = true;
                continue_button.classList.add("button_disabled");
                continue_button.classList.remove("button");
            }
            break;

        case "petition_description":
            if (e.value.length > 0) {
                continue_button.disabled = false;
                continue_button.classList.add("button");
                continue_button.classList.remove("button_disabled");
            } else {
                continue_button.disabled = true;
                continue_button.classList.add("button_disabled");
                continue_button.classList.remove("button");
            }
            break;

        case "file":
            if (e.files.item(0) != null) {
                file_button.innerHTML = e.files.item(0).name;
                submit_button.disabled = false;
                submit_button.classList.add("button");
                submit_button.classList.remove("button_disabled");
            } else {
                submit_button.disabled = true;
                submit_button.classList.add("button_disabled");
                submit_button.classList.remove("button");
            }
            break;
    }
}

function back_onclick() {
    stage -= 1;
    refresh();
}

function continue_onclick() {
    switch (stage) {
        case 0:
            if (title_input.value.length <= 90 && title_input.value.length > 0) {
                stage = 1;
            }
            break;

        case 1:
            if (description_input.value.length > 0) {
                stage = 2;
            }
            break;
    }
    refresh();
}

function refresh() {
    switch (stage) {
        case 0:
            page_title.innerHTML = "Write your petition title";
            page_description.innerHTML = "Tell people what you want to change.";
            form_label.innerHTML = "Petition title";
            title_input.style.display = "inherit";
            remaining_characters_span.style.display = "inherit";
            description_input.style.display = "none";
            title_tips.style.display = "inherit";
            description_tips.style.display = "none";
            image_box.style.display = "none";
            file_button.disabled = true;
            photo_tips.style.display = "none";
            continue_button.style.display = "inherit";
            back_button.style.display = "none";
            submit_button.style.display = "none";
            petition_oninput(title_input);
            break;

        case 1:
            page_title.innerHTML = "Tell your story";
            page_description.innerHTML = "Explain the problem and why you care about it. Showing how it will impact you, your family, or your community will make people more likely to support it.";
            form_label.innerHTML = "";
            title_input.style.display = "none";
            remaining_characters_span.style.display = "none";
            description_input.style.display = "inherit";
            title_tips.style.display = "none";
            description_tips.style.display = "inherit";
            image_box.style.display = "none";
            file_button.disabled = true;
            photo_tips.style.display = "none";
            continue_button.style.display = "inherit";
            back_button.style.display = "inherit";
            submit_button.style.display = "none";
            petition_oninput(description_input);
            break;

        case 2:
            page_title.innerHTML = "Add a photo";
            page_description.innerHTML = "";
            form_label.innerHTML = "";
            title_input.style.display = "none";
            remaining_characters_span.style.display = "none";
            description_input.style.display = "none";
            title_tips.style.display = "none";
            description_tips.style.display = "none";
            image_box.style.display = "flex";
            file_button.disabled = false;
            photo_tips.style.display = "inherit";
            continue_button.style.display = "none";
            back_button.style.display = "inherit";
            submit_button.style.display = "inherit";
            petition_oninput(file_input);
            break;
    }
}

refresh();