$(document).ready(function () {
    const url = document.location.toString();
    if (url.match('#')) {
        $('.nav-tabs a[href="#' + url.split('#')[1] + '"]').tab('show');
    }
    $('.nav-tabs a').on('click', function () {
        window.location.hash = this.target.hash;
        $(this).tab('show');
    });

    $('#sort').on('click', function () {
        console.log('e')
    })
});