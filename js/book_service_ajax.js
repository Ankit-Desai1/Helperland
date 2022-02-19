$("#check_availability").on("click", function() {

    // alert('it work');
    if ($.trim($('#postalcode').val()).length == 0) {
        var postalerror = "Postal Code is Required";
        $('#postal_err').text(postalerror);
    }
    if ($.trim($('#postalcode').val()).length == 6) {
        var postalerror = "";
        $('#postal_err').text(postalerror);
        var postal = $("#postalcode").val();
        $("#iframeloading").show();

        $.ajax({
            type: 'POST',
            url: "http://localhost/helper/?controller=Helperland&function=CheckPostalCode",
            data: {
                "check_postal": 1,
                "postal": postal,
            },

            success: function(data) {
                $("#iframeloading").hide();
                if (data == 1) {
                    $(".setup-service .firsttab  .nav-link").removeClass('active');
                    $(".tab-content .firsttabs").removeClass('active');
                    $(".tab-content .firsttabs ").removeClass('show');
                    $(".setup-service .firsttab  .nav-link").addClass('completed');

                    $(".setup-service .secondtab  .nav-link").addClass('show');
                    $(".setup-service .secondtab  .nav-link").addClass('active');
                    $(".tab-content .secondtabs").addClass('active');
                    $(".tab-content .secondtabs ").addClass('show');
                    // alert(data);
                    var pincode = $("#pincode").val(postal);

                    $.ajax({
                        type: 'POST',
                        url: "http://localhost/helper/?controller=Helperland&function=GetLocationCity",
                        data: {
                            "get_postal": 1,
                            "postalcode": postal,
                        },
                        dataType: 'json',
                        success: function(data) {
                            optionText = data[0];
                            optionValue = data[0];

                            $('#location').append(`<option value="${optionValue}" selected>
                                                ${optionText}
                                            </option>`);
                        }
                    });
                } else {
                    var response = "Postal Code Not Available";
                    $('#postal_err').text(response);
                    // alert(data);
                }

            }

        });

    } else {
        var postalerror = "Please Enter Valid Postal Code";
        $('#postal_err').text(postalerror);
    }
})