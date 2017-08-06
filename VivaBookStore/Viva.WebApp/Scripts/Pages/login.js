
// https://weblog.west-wind.com/posts/2010/sep/07/using-jquery-to-post-form-data-to-an-aspnet-asmx-ajax-web-service
function login(event) {
    event.preventDefault();

    // Get username/pass from input
    var user = $("#username").val();
    var pass = $("#password").val();
    
    if (username == null || username == ""
        || password == null || password == "") {
        // If user don't input user/pass, show error'
        alert("Please enter user/pass");
    }
    else {
        $("#progress-bar").show();
        $("#btnSignIn").hide();
        // Send Ajax request to vivawebservice to check user/pass
        $.ajax({
            url: "VivaWebService.asmx/Login",
            type: "POST", // Action: POST/GET/PUT/DELETE....
            contentType: "application/json", // Content type
            data: JSON.stringify({ username: user, password: pass }),
            dataType: "json",
            success: function (result) {
                // This method will be triggered when server return value


                $("#progress-bar").hide();
                $("#btnSignIn").show();
                // There is no customer with these user/pass
                if (result.d == null) {
                    alert("Wrong Username or password");
                } else {
                    // Login Success
                    $('#logindropdown').hide();
                    $('#logoutdropdown').show();                    
                    $('#helloText').html('Hi ' + result.d.FirstName);
                    $('#changeprofile-link').attr("href", "ChangeProfile.aspx?customerid=" + result.d.Id);
                }
            },
            error: function (xhr, status) {
                alert("An error occurred: " + status);
                $("#progress-bar").hide();
                $("#btnSignIn").show();                
            }
        });
    }    
}
