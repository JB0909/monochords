var count;
//クリックがフォーム内かそれ以外かを判定
$(document).click(function(event) {
    var target_id = $(event.target).parent().attr('id');
    var target = $(event.target).parent();
    //それ以外の場合
    if(!$(target).closest('#'+target_id).length) {
            if (count > 0 ){
                //それ以外で前回のカウントが0より大きい場合
            } else {
                //それ以外で前回のカウントが0の場合は処理と隠す
                $(target).find('.js-text-field').css({ 'height' : 'auto'});
                $(target).find('.js-submit').css({ 'display' : 'none'});
                $(target).find(".js-text-count").text("");
                $(target).find(".text-count").text("");
            }
    //フォーム内の場合
    } else {
        //前回のカウントが0の場合
        if (count === 0){
            $('.js-text').nextAll(".js-text-count").text("");
            $('.js-text').nextAll(".text-count").text("");
            $('.js-text').find('.js-text-field').css({ 'height' : 'auto'});
            $('.js-text').nextAll('.js-submit').css({ 'display' : 'none'});
            //色処理
            if (count > 255 || count == 0 ){
                $(target).nextAll(".js-text-count").css("color","red");
            } else {
                $(target).nextAll(".js-text-count").css("color","#999");
            }
        }
        //カウントを新たに定義
        count = $(event.target).val().replace(/\n/g, "改行").length;
        //色処理
        if (count > 255 || count == 0 ){
            $(target).nextAll(".js-text-count").css("color","red");
        } else {
            $(target).nextAll(".js-text-count").css("color","#999");
        }
        //処理開始
        $(target).children('.js-text-field').css({ 'height' : '150px'});
        $(target).nextAll('.js-submit').css({ 'display' : 'inline-block'});
        $(target).nextAll(".js-text-count").text( count );
        $(target).nextAll(".text-count").text("/255文字");
        //入力があった場合
        $(target).children('.js-text-field').on('input', function() {
            //カウントを新たに定義
            count = $(this).val().replace(/\n/g, "改行").length;
            //色処理
            if (count > 255 || count == 0 ) {
                $(target).nextAll(".js-text-count").css("color","red");
            } else {
                $(target).nextAll(".js-text-count").css("color","#999");
            }
            //カウントしている文字数を表示
            $(target).nextAll(".js-text-count").text( count );
            $(target).nextAll(".text-count").text("/255文字");
        });
    }
});