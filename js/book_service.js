function set_service(evt, level) {
    var i, tabcontent, tablinks;
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }
    tablinks = document.getElementsByClassName("tablinks");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active");
    }
    document.getElementById(level).style.display = "block";
    evt.currentTarget.className += " active";
}
document.getElementById("defaultOpen").click();



$(document).ready(function() {
    $("#add_address").click(function() {
        $('#add_address').hide();
        $('.address_form').show();
    })
    $("#cancel").on("click", function() {
        $('#add_address').show();
        $('.address_form').hide();

    })
});