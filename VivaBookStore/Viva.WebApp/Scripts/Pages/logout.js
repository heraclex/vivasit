
function logout(event) {
    event.preventDefault();

    // Send Ajax request to vivawebservice to check user/pass
    $.ajax({
        url: "VivaWebService.asmx/Logout",
        type: "POST", // Action: POST/GET/PUT/DELETE....
        contentType: "application/json", // Content type
        dataType: "json",
        success: function (result) {
            // Logout Success

            alert("Logout Success");
            //redirect to default
            window.location = "Default.aspx";
        },
        error: function (xhr, status) {
            alert("An error occurred: " + status);
        }
    });
}