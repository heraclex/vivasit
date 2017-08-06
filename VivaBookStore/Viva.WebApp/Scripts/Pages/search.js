function search(event) {
    event.preventDefault();
    var searchkeywork = $("#searchkeyword").val();
    window.location.href = "/Search?searchkeyword=" + searchkeywork;
    return false;
}