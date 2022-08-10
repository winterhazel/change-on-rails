petitions = document.getElementById('petitions');
query = document.getElementById('query');
button = document.getElementById('search_button');
load_more = document.getElementById('load_more');

function search_oninput() {
    if (query.value.length > 0) {
        button.classList.add("button");
        button.classList.remove("button_disabled");
        button.disabled = false;
    } else {
        button.classList.add("button_disabled");
        button.classList.remove("button");
        button.disabled = true;
    }
}

function search_onclick() {
    petitions.innerHTML = "";
    load_more.style.display = "none";
}