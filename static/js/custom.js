$(function(){
    // Include html File
    $('.gnb-include').load('/static/include/gnb.html')
    $('.main-header-include').load('/static/include/main-header.html')

    /* Main Suggestion */
    $('.main-suggestions').slick({
        slidesToShow: 3, /* 화면에 츨력할 슬라이드 개수 */
        dots: false, /* 하단 도트 네비게이션 출력 안 보이는게 기본값(false)*/
        arrows: false,
    });

    /* Special Price */
    $('.special-price').slick({
        slidesToShow: 2,
        dots: false, /* 하단 도트 네비게이션 출력 안 보이는게 기본값(false)*/
        arrows: false,
    });
})