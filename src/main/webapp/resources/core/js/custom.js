$(function() {

    //datepicker
    $(".datepicker,#datepicker").datepicker({
        prevText: 'Last',
        nextText: 'Next',
        currentText: 'Today',
        monthNames: ['01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12'],
        monthNamesShort: ['01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12'],
        dayNames: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'],
        dayNamesShort: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'],
        dayNamesMin: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'],
        buttonImageOnly: false,
        changeMonth: true,
        changeYear: true,
        dateFormat: 'yy.mm.dd',
    });

    /*/ 즐겨찾기
     var favHei = $("#header .fav-bx").height();
     $("#header .fav-bx").css({ "top":-favHei - 1});
     $("#header .fav-bx .bt-fav").click(function(){
         facEve();
     });*/

    // 왼쪽메뉴
    $("#lm-sidenav .bt-mn").click(function() {
        //$(".snb > li").removeClass("active");  
        if ($("#lm").hasClass("active")) {
            $("#lm").removeClass("active");
            //$(".dv-loc .inbx").removeClass("active");//탭메뉴 패딩 조절
            //"#wrap").removeClass("lmClose");
        } else {
            $("#lm").addClass("active");
            //$(".dv-loc .inbx").addClass("active");
            //"#wrap").addClass("lmClose");//탭메뉴 패딩 조절
        }

    });

    // 왼쪽메뉴_모바일 2020-06-10추가
    $(".bt-mn_m").click(function() {
        //$(".snb > li").removeClass("active");  
        if ($("#lm").hasClass("active")) {
            $("#lm").removeClass("active");
            $(".dimbg").removeClass("show")
            //$(".dv-loc .inbx").removeClass("active");//탭메뉴 패딩 조절
            //"#wrap").removeClass("lmClose");
        } else {
            $("#lm").addClass("active");
            $(".dimbg").addClass("show")
            //$(".dv-loc .inbx").addClass("active");
            //"#wrap").addClass("lmClose");//탭메뉴 패딩 조절
        }

    });
    $(".dimbg").click(function() {
        //$(".snb > li").removeClass("active");  
        if ($("#lm").hasClass("active")) {
            $("#lm").removeClass("active");
            $(".dimbg").removeClass("show")

        } else {
            $("#lm").addClass("active");
            $(".dimbg").addClass("show")
        }

    });


    if ($("#wrap").hasClass("lmClose")) {} else {
        $(".snb > li").each(function(idx) {
            if ($(".snb > li").eq(idx).find(".mdepth2").length > 0) {
                $(".snb > li").eq(idx).addClass('hasSub');
                $('.snb > li.hasSub > a').removeAttr('href');
            }
        });
    }

    /*filebox
    var fileTarget = $('.filebox .upload-hidden'); 
    fileTarget.on('change', function(){ // 값이 변경되면 
        if(window.FileReader){ // modern browser 
            var filename = $(this)[0].files[0].name; } else { // old IE 
            var filename = $(this).val().split('/').pop().split('\\').pop(); // 파일명만 추출 
        } // 추출한 파일명 삽입 
        $(this).siblings('.upload-name').val(filename); 
    });
    
    
    $(".btFav").click(function(){
        if($(this).hasClass("dis")){
            $(this).removeClass("dis");
            $(this).addClass("active");
        }else{  
            $(this).removeClass("active");
            $(this).addClass("dis");
        }    
    });*/

});

/*window).on('resize', function(){
    var favHei = $("#header .fav-bx").height();
    $("#header .fav-bx").css({ "top":-favHei - 1});
});

function facEve(){
    var favHei = $("#header .fav-bx").height();
    $btFav = $("#header .fav-bx .bt-fav");
    if($btFav.hasClass("active")){
        $btFav.removeClass("active");
        $("#header .fav-bx").removeClass("open");
        $("#header .fav-bx").css({ "top":-favHei - 1});
    } else {
        $btFav.addClass("active");
        $("#header .fav-bx").addClass("open");
        $("#header .fav-bx").css({ "top":0});
    }
}*/

$(document).on("click", ".snb > li > a", subMenu);
$(document).on("ckick", ".snbClo > li > a ", subMenuOv);
$(document).on("click", ".mdepth2 > li > a,.mdepth2 .inbx > ul > li > a", subMenu02);
$(document).on("mouseenter", ".utill_set > li > a", utilMenuOv);
$(document).on("mouseleave", ".utill_set > li", utilMenuOut);
$(document).on("mouseenter", ".snbClo_horizontal > li > a", subMenuOv_horziontal);
$(document).on("mouseleave", ".snbClo_horizontal > li", subMenuOut_horziontal);
//$(document).on("click", ".mdepth3 > li > a", subMenu03);

function subMenu(e) {

    $thisp = $(this).parent();

    var chk = false;
    $(".snb > li,.mdepth3 > li ,.mdepth3 .inbx > ul > li ").removeClass("active"); //메뉴열고 닫힘 조정
    var dropDown = $(this).next(".mdepth2");
    $(".mdepth2").not(dropDown).slideUp(200); //메뉴열고 닫힘 조정
    dropDown.stop(false, true).slideToggle(200, function() {
        if ($(this).is(":hidden")) {
            $thisp.removeClass("active");
            chk = false;
        } else {
            $thisp.addClass("active");
            chk = true;
        }
    });

    if (!chk) {
        $(this).parent().find(".mdepth3").each(function(idx) {
            if ($(this).css("display") == "block") {
                $(this).parent().removeClass("active");
                $(this).parent().find(".mdepth3").hide();
            }
        });
    }

    $(".mdepth2 > li").each(function(idx) {
        if ($(".mdepth2 > li").eq(idx).find(".mdepth3").length > 0) {
            $(".mdepth2 > li").eq(idx).addClass('hasSub');
            //$(".mdepth2 > li.hasSub > a").removeAttr('href');
        }
    });

}

function subMenuOv(e) {

    $thisp = $(this).parent();

    var chk = false;
    $(".snbClo > li").removeClass("active");

    if ($(this).is(":hidden")) {

        $thisp.removeClass("active");
        chk = false;
    } else {
        $thisp.addClass("active");
        chk = true;
    }


}

function subMenu02(e) {
    if ($(this).next(".mdepth3").find("li:eq(0)").length > 0) {
        e.preventDefault();
    }

    $thisp = $(this).parent();

    $(".mdepth2 > li,.mdepth2 > .inbx > ul > li").removeClass("active");
    $(".mdepth3 > li,.mdepth3 .inbx > ul > li").removeClass("active");

    $thisp.addClass("active");

    var dropDown = $(this).next(".mdepth3");
    $(".mdepth3").not(dropDown).slideUp(200); //메뉴열고닫힘 조정
    dropDown.stop(false, true).slideToggle(200, function() {
        if ($(this).is(":hidden")) {
            $thisp.removeClass("open");
        } else {
            $thisp.addClass("open");
        }
    });
}

//즐겨찾기
function utilMenuOv(e) {

    $thispd = $(this).parent();

    var chk1 = false;
    $(".utill_set > li").removeClass("active");

    if ($(this).is(":hidden")) {
        $thispd.removeClass("active");
        chk1 = false;

    } else {
        $thispd.addClass("active");
        chk1 = true;
    }

    if (!chk1) {
        $(this).parent().find(".utill_set_mdepth3").each(function(idx) {
            //alert('1123');
            //alert($(this).css("display"));
            if ($(this).css("display") == "block") {
                //alert('in');
                $(this).parent().removeClass("active");
                $(this).parent().find(".utill_set_mdepth3").hide();
            }
        });
    }

    /* $(".mdepth21 > li,.mdepth21 > li,.mdepth21 > .inbx > ul > li").each(function(idx){
         if($(".mdepth21 > li,.mdepth21 > .inbx > ul > li").eq(idx).find(".mdepth3").length > 0){
             $(".mdepth21 > li,.mdepth21 > .inbx > ul > li").eq(idx).addClass('hasSub');
             $('.mdepth21 > li.hasSub > a,.mdepth21 > .inbx > ul > li.hasSub > a').removeAttr('href');
         }
     });*/

}

function utilMenuOut(e) {

    $thispd = $(this).parent();
    var chk1 = false;
    $(".utill_set > li").removeClass("active");
}



//상단 가로메뉴

function subMenuOv_horziontal(e) {
    $thisp = $(this).parent();
    var chk = false;
    $(".snbClo_horizontal > li").removeClass("active");

    if ($(this).is(":hidden")) {
        $thisp.removeClass("active");
        chk = false;
    } else {
        $thisp.addClass("active");
        chk = true;
    }
    if (!chk) {
        $(this).parent().find(".mdepth3").each(function(idx) {
            if ($(this).css("display") == "block") {
                $(this).parent().removeClass("active");
                $(this).parent().find(".mdepth3").hide();
            }
        });
    }
    /*$(".mdepth2 > li,.mdepth2 > li,.mdepth2 > .inbx > ul > li").each(function(idx) {
        if ($(".mdepth2 > li,.mdepth2 > .inbx > ul > li").eq(idx).find(".mdepth3").length > 0) {
            $(".mdepth2 > li,.mdepth2 > .inbx > ul > li").eq(idx).addClass('hasSub');
            $('.mdepth2 > li.hasSub > a,.mdepth2 > .inbx > ul > li.hasSub > a').removeAttr('href');
        }
    });*/
}

function subMenuOut_horziontal(e) {

    $thisp = $(this).parent();
    var chk = false;
    $(".snbClo_horizontal > li").removeClass("active");
}

/*function subMenu03(e){
    if($(this).next(".mdepth4").find("li:eq(0)").length > 0){
        e.preventDefault();
    }

    $thisp = $(this).parent();

    $(".mdepth3 > li").removeClass("active");

    $thisp.addClass("active");

    var dropDown = $(this).next(".mdepth4");
    $(".mdepth4").not(dropDown).slideUp(200);
    dropDown.stop(false, true).slideToggle(200, function(){
        if($(this).is(":hidden")){
            $thisp.removeClass("active");
        }else{
            $thisp.addClass("active");
        }
    });
}*/

// 레이어팝업
function callPop(classId) {
    $(classId).bPopup({});
    $(classId).draggable({
        'cancel': '.cont-wrap'
    }); //레이어 드래그   

}

// layer show
function showHide(layer) {
    if (document.getElementById(layer).style.display == "none") {
        document.getElementById(layer).style.display = "block";
    } else {
        document.getElementById(layer).style.display = "none";
    }
}

//파일추가 row
function addRow() {
    var count = document.getElementById("fileList").rows.length;
    if (count == 0) {
        //alert("파일은 n 업로드 가능합니다.");
        return;
    }
    var oRow = fileList.insertRow();
    oRow.onmouseover = function() { fileList.clickedRowIndex = this.rowIndex };
    var oCell1 = oRow.insertCell();
    var oCell2 = oRow.insertCell();
    //var oCell3 = oRow.insertCell();
    var oCell4 = oRow.insertCell();
    oCell1.innerHTML = "<input type=text class=fileadd>";
    oCell2.innerHTML = "<a href=#a class=file_btn>파일선택</a><a href=#a class=fildel_btn onClick=\"delRow()\">삭제</a>";
    //oCell3.innerHTML = "<input type=button value=\" 추가 \" onClick=\"addRow()\">";
    //oCell4.innerHTML = "<a href=#a class=fildel_btn onClick=\"delRow()\">삭제</a>";
}

function delRow() {
    var count = document.getElementById("fileList").rows.length;
    if (count == 1) {
        alert("마지막은 지울 수 없습니다.");
        return;
    }
    fileList.deleteRow(fileList.clickedRowIndex);
}
// n수 많큼 행 추가
function addRowCnt() {
    //var ln = document.getElementById("fileList").rows.length;
    var ln = 2; //n
    for (i = 0; i < ln; i++) {
        addRow();
    }
}

//탭메뉴
$(document).ready(function() {
    //Default Action
    $(".tab_contentinner").hide(); //Hide all content
    $("ul.tabs li:first").addClass("active").show(); //Activate first tab
    $(".tab_contentinner:first").show(); //Show first tab content

    //On Click Event
    $("ul.tabs li").click(function() {
        $("ul.tabs li").removeClass("active"); //Remove any "active" class
        $(this).addClass("active"); //Add "active" class to selected tab
        $(".tab_contentinner").hide(); //Hide all tab content
        var activeTab = $(this).find("a").attr("href"); //Find the rel attribute value to identify the active tab + content
        $(activeTab).fadeIn(); //Fade in the active content
        return false;
    });
    //테이블 셋팅 사이드 메뉴
    $('.menu-ham').click(function() {
        $('.menu').animate({ right: '0px' }, 110)
    });

    $('.close-menu').click(function() {
        $('.menu').animate({ right: '-100%' }, 110)
    });

    //코멘트
    $('.btn4').click(function() {
        $('.comment_box').slideToggle('slow')

    })
    //전체 메뉴 설정
    $('.all_seting').click(function() {
        $('.set_menu').animate({ right: '0px' }, 70)
    });

    $('.set_menu_close').click(function() {
        $('.set_menu').animate({ right: '-400px' }, 70)
    });

    //개인설정
    $("b").on('mouseover', function() {
        $(this).find('a').addClass('active');
        $('.personal_seeting').addClass('active');
    }).on('mouseout', function() {
        $(this).find('a').removeClass('active');
        $('.personal_seeting').removeClass('active');
    });

    //개인설정-가로
    $(".horizonta_per").on('mouseover', function() {
        $(this).find('a').addClass('active');
        $('.hor_personal_seeting').addClass('active');
    }).on('mouseout', function() {
        $(this).find('a').removeClass('active');
        $('.hor_personal_seeting').removeClass('active');
    });


    //체크박스-Horizontal
    /* $(".chekd").change(function() {
         if ($(".chekd").is(":checked")) {
             //alert("체크박스 체크했음!");
             $('.horizontal').slideToggle('slow');
             $('#lm-sidenav .bt-mn').slideToggle('slow');
             $('#lm').removeClass('active');
             $('.horizonta_persoal').addClass('active');
         } else {
             //alert("체크박스 체크 해제!");
             $('.horizontal').removeClass('active');
             $('#lm-sidenav .bt-mn').removeClass('active');
             $('#lm').addClass('active');
             $('.horizonta_persoal').removeClass('active');           
         }
     });*/
    /******2020 스크립트 수정*************/

    //체크박스-Horizontal
    $('input[type=radio][name=chkd0]').change(function() {
        if (this.value == '02') {
            $('.horizontal').addClass('active');
            $('#lm-sidenav .bt-mn').addClass('active');
            $('#lm').removeClass('active');
            //$('.horizonta_persoal').show('slow');
            $('#header .hd-top').addClass('active');
        } else if (this.value == '01') {
            $('.horizontal').removeClass('active');
            $('#lm-sidenav .bt-mn').removeClass('active');
            $('#lm').removeClass('active');
            //$('.horizonta_persoal').hide('slow');
            $('#header .hd-top').removeClass('active');
        }
    });

    //테이블 tr클릭 배경색 변경-테스트
    /*$('table.list01 tr').click(function(){
        var selected = $('this').hasClass('selected')
        $('.selected').removeClass('selected');
        if(!selected)
            $(this).addClass('selected')
    })*/


});

//테마변경
$(document).ready(function() {
    $('#theme01').click(function() {
        $('#wrap').addClass('default');
        $('#wrap').removeClass('black');
        $('#wrap').removeClass('yellow')
    });
    $('#theme02').click(function() {
        $('#wrap').addClass('black');
        $('#wrap').removeClass('default');
        $('#wrap').removeClass('yellow')
    });
    $('#theme03').click(function() {
        $('#wrap').addClass('yellow');
        $('#wrap').removeClass('default');
        $('#wrap').removeClass('black')
    });

    //메일 열고닥기
    $('.mail_content_list h3').click(function() {

        var text = $(this).siblings('.panel');

        if (text.is(':hidden')) {
            text.slideDown('200');
            $(this).addClass('active');
            //$(this).children('span').html('-');       
        } else {
            text.slideUp('200');
            $(this).removeClass('active');
            //$(this).children('span').html('+');       
        }

    });

    ////메일 쓰기
    $('.mail_input_arrow').click(function() {

        var text = $(this).siblings('.mail_panel');

        if (text.is(':hidden')) {
            text.show();
            $(this).addClass('active');
            //$(this).children('span').html('-');       
        } else {
            text.hide();
            $(this).removeClass('active');
            //$(this).children('span').html('+');       
        }

    });

    //숨은참조
    $(".mailslide").click(function() {
        status = $(".hidetr").css("display");
        if (status == "none") { $(".hidetr").css("display", "");
            $('.mailslide_btn').addClass('open');
         }
        else { $(".hidetr").css("display", "none");
             $('.mailslide_btn').removeClass('open');
         }
    });

    //아이콘 오버
    $(".link").hover(function(){
        $(this).find('.hidden_icon').stop().addClass('show_icon');
    },function(){
        $(this).find('.hidden_icon').stop().removeClass('show_icon');
    });   



})