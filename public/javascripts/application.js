// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
old_style = {}

function toogle_element(element, type) {
    if (element.style.display == "none") {
        element.style.display = type
    } else {
        element.style.display = "none"
    }
}

function toogle(form_id) {
    toogle_element(document.getElementById("form"+form_id), "block")
    toogle_element(document.getElementById("reply"+form_id), "inline")
    toogle_element(document.getElementById("hidereply"+form_id), "inline")
}

