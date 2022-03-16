$(function(){	
    
    //datepicker
	$(".datepicker,#datepicker").datepicker({
        prevText: 'Last',
        nextText: 'Next',
        currentText: 'Today',
        monthNames: ['01','02','03','04','05','06','07','08','09','10','11','12'],
        monthNamesShort: ['01','02','03','04','05','06','07','08','09','10','11','12'],
        dayNames: ['Sun','Mon','Tue','Wed','Thu','Fri','Sat'],
        dayNamesShort: ['Sun','Mon','Tue','Wed','Thu','Fri','Sat'],
		dayNamesMin: ['Sun','Mon','Tue','Wed','Thu','Fri','Sat'],
		buttonImageOnly: false,
		changeMonth: true,
		changeYear: true,
		dateFormat: 'yy-mm-dd',       
	});
    
    // 즐겨찾기
    var favHei = $("#header .fav-bx").height();
    $("#header .fav-bx").css({ "top":-favHei - 1});
    $("#header .fav-bx .bt-fav").click(function(){
        facEve();
	});
    
    // 왼쪽메뉴
    $("#lm .bt-mn").click(function(){
        //$(".snb > li").removeClass("active");  
        if($(this).hasClass("active")){
            $(this).removeClass("active");
            $("#wrap").removeClass("lmClose");
        } else {
            $(this).addClass("active");
            $("#wrap").addClass("lmClose");
        }
	});
    
    if($("#wrap").hasClass("lmClose")){
    } else {
        $(".snb > li").each(function(idx){
            if($(".snb > li").eq(idx).find(".mdepth2").length > 0){
                $(".snb > li").eq(idx).addClass('hasSub');
                $('.snb > li.hasSub > a').removeAttr('href');
            }
        });
    }
    
    //filebox
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
    });
    
});

$(window).on('resize', function(){
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
}

$(document).on("click", ".snb > li > a", subMenu);
$(document).on("mouseenter", ".snbClo > li > a", subMenuOv);
$(document).on("mouseleave", ".snbClo > li", subMenuOut);
$(document).on("click", ".mdepth2 > li > a,.mdepth2 .inbx > ul > li > a", subMenu02);
//$(document).on("click", ".mdepth3 > li > a", subMenu03);

function subMenu(e){
        
    $thisp = $(this).parent();

    var chk = false;
    $(".snb > li,.mdepth3 > li ,.mdepth3 .inbx > ul > li ").removeClass("active");//메뉴열고 닫힘 조정
    var dropDown = $(this).next(".mdepth2");   
    $(".mdepth2").not(dropDown).slideUp(200);//메뉴열고 닫힘 조정
    dropDown.stop(false, true).slideToggle(200, function(){
        if($(this).is(":hidden")){
            $thisp.removeClass("active");
            chk = false;
        }else{
            $thisp.addClass("active");
            chk = true;
        }
    });

    if(!chk){
        $(this).parent().find(".mdepth3").each(function(idx){
            if($(this).css("display") == "block"){
                $(this).parent().removeClass("active");
                $(this).parent().find(".mdepth3").hide();
            }
        });
    }

    $(".mdepth2 > li").each(function(idx){
        if($(".mdepth2 > li").eq(idx).find(".mdepth3").length > 0){
            $(".mdepth2 > li").eq(idx).addClass('hasSub');
            $(".mdepth2 > li.hasSub > a").removeAttr('href');
        }
    });
    
}

function subMenuOv(e){
    
    $thisp = $(this).parent();

    var chk = false;
    $(".snbClo > li").removeClass("active"); 
    
    if($(this).is(":hidden")){
        $thisp.removeClass("active");
        chk = false;
    }else{
        $thisp.addClass("active");
        chk = true;
    }

    if(!chk){
        $(this).parent().find(".mdepth3").each(function(idx){
            if($(this).css("display") == "block"){
                $(this).parent().removeClass("active");
                $(this).parent().find(".mdepth3").hide();
            }
        });
    }

    $(".mdepth2 > li,.mdepth2 > li,.mdepth2 > .inbx > ul > li").each(function(idx){
        if($(".mdepth2 > li,.mdepth2 > .inbx > ul > li").eq(idx).find(".mdepth3").length > 0){
            $(".mdepth2 > li,.mdepth2 > .inbx > ul > li").eq(idx).addClass('hasSub');
            $('.mdepth2 > li.hasSub > a,.mdepth2 > .inbx > ul > li.hasSub > a').removeAttr('href');
        }
    });
    
}

function subMenuOut(e){
    
    $thisp = $(this).parent();

    var chk = false;
    $(".snbClo > li").removeClass("active"); 
    
}

function subMenu02(e){
	if($(this).next(".mdepth3").find("li:eq(0)").length > 0){
		e.preventDefault();
	}

	$thisp = $(this).parent();

	$(".mdepth2 > li,.mdepth2 > .inbx > ul > li").removeClass("active");   
    $(".mdepth3 > li,.mdepth3 .inbx > ul > li").removeClass("active");     
	
	$thisp.addClass("active");

	var dropDown = $(this).next(".mdepth3");
	$(".mdepth3").not(dropDown).slideUp(200);//메뉴열고닫힘 조정
	dropDown.stop(false, true).slideToggle(200, function(){
		if($(this).is(":hidden")){
			$thisp.removeClass("open");
		}else{
			$thisp.addClass("open");
		}
	});
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
function callPop(classId){
	$(classId).bPopup();
}


