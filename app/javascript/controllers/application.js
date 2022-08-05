import {Application} from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus = application

export {application}

// Hide dropdown menu
document.body.addEventListener('click', hide_dropdown_menu, true)

function hide_dropdown_menu() {
    let dropdown_menu = document.getElementById('dropdown_menu');
    if (dropdown_menu.style.display === 'block') {
        dropdown_menu.style.display = 'none';
    }
}