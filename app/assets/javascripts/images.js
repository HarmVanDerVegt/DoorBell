function checkIfUpdates() {
    $.post(
        '/ajax_check/check',
        {imageCount: $('.image-class').length,
        buttonReject: $('.btn-reject').length},
        function(data){
            if(data.do_reload){
                location.reload();
                //console.log("Er gebeurt iets!!!!");
                //console.log(data.more_images);
            }
            setTimeout(checkIfUpdates, 10000);
        },
        'json'
    )
}