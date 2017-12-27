/*侧边栏*/
$(document).ready(function () {
    var trigger = $('.hamburger'),
        overlay = $('.overlay'),
        isClosed = false;

    trigger.click(function () {
        hamburger_cross();
    });

    function hamburger_cross() {

        if (isClosed == true) {
            overlay.hide();
            trigger.removeClass('is-open');
            trigger.addClass('is-closed');
            isClosed = false;
        } else {
            overlay.show();
            trigger.removeClass('is-closed');
            trigger.addClass('is-open');
            isClosed = true;
        }
    }

    $('[data-toggle="offcanvas"]').click(function () {
        $('#wrapper').toggleClass('toggled');
    });
});

/*选项组-top*/
function setTab(name,cursel){
    cursel_0=cursel;
    for(var i=1; i<=links_len; i++){
        var menu = document.getElementById(name+i);
        var menudiv = document.getElementById("con_"+name+"_"+i);
        if(i==cursel){
            menu.className="off";
            menudiv.style.display="block";
        }
        else{
            menu.className="";
            menudiv.style.display="none";
        }
    }
}
function Next(){
    cursel_0++;
    if (cursel_0>links_len)cursel_0=1
    setTab(name_0,cursel_0);
}
var name_0='one';
var cursel_0=1;
//循环周期（毫秒）
var links_len,iIntervalId;
onload=function(){
    var links = document.getElementById("tab1").getElementsByTagName('li')
    links_len=links.length;
    for(var i=0; i<links_len; i++){
        links[i].onmouseover=function(){
            clearInterval(iIntervalId);
            this.onmouseout=function(){
                iIntervalId = setInterval(Next,ScrollTime);;
            }
        }
    }
    document.getElementById("con_"+name_0+"_"+links_len).parentNode.onmouseover=function(){
        clearInterval(iIntervalId);
        this.onmouseout=function(){
            iIntervalId = setInterval(Next,ScrollTime);;
        }
    }
    setTab(name_0,cursel_0);
    iIntervalId = setInterval(Next,ScrollTime);
}

/*多选删除*/
var nHospitalNo = "<?=$_GDATA['nHospital']?>";
var nKind = "<?=$_GDATA['nKind']?>";
var keyfield = "<?=$_GDATA['keyfield']?>";
var keyword = "<?=$_GDATA['keyword']?>";
var nLimit = "<?=$nLimit?>";
var nOrder = "<?=$_GDATA['nOrder']?>";
var isSend = false;
var oParams;
(function(){
    oParams = new function(){
        this.setSel = function(tmpStr , tmpVal){
            $('#'+tmpStr).val(tmpVal);
        }
        this.getSel = function(tmpStr){
            return $('#'+tmpStr+' > option:selected').val();
        }
        this.setCtrBox = function(tmpStr ,bMode){
            $("input[type=checkbox][name="+tmpStr+"]").prop("checked",bMode);
        }
        this.getBox = function(tmpStr){
            var arRe = "";
            var nSeq = "";
            $("input[name="+tmpStr+"]:checked").each(function(){
                nSeq = $(this).val();
                arRe += nSeq+",";
            });

            if(arRe!=""){
                arRe = arRe.substr(0,arRe.length-1);
            }
            return arRe;
        }
    }
}());
function addd(){
    var arSeq = oParams.getBox('arSel');
    alert(arSeq);
}

/*遮罩层*/

$(function() {
    //alert($(window).height());
    $('.btn-default1').click(function() {
        $('#code').center();
        $('#goodcover').show();
        $('#code').fadeIn();
    });
    $('#closebt').click(function() {
        $('#code').hide();
        $('#goodcover').hide();
    });
    $('#goodcover').click(function() {
        $('#code').hide();
        $('#goodcover').hide();
    });
    /*var val=$(window).height();
    var codeheight=$("#code").height();
    var topheight=(val-codeheight)/2;
    $('#code').css('top',topheight);*/
    jQuery.fn.center = function(loaded) {
        var obj = this;
        body_width = parseInt($(window).width());
        body_height = parseInt($(window).height());
        block_width = parseInt(obj.width());
        block_height = parseInt(obj.height());

        left_position = parseInt((body_width / 2) - (block_width / 2) + $(window).scrollLeft());
        if (body_width < block_width) {
            left_position = 0 + $(window).scrollLeft();
        };

        top_position = parseInt((body_height / 2) - (block_height / 2) + $(window).scrollTop());
        if (body_height < block_height) {
            top_position = 0 + $(window).scrollTop();
        };

        if (!loaded) {

            obj.css({
                'position': 'absolute'
            });
            obj.css({
                'top': ($(window).height() - $('#code').height()) * 0.5,
                'left': left_position
            });
            $(window).bind('resize', function() {
                obj.center(!loaded);
            });
            $(window).bind('scroll', function() {
                obj.center(!loaded);
            });

        } else {
            obj.stop();
            obj.css({
                'position': 'absolute'
            });
            obj.animate({
                'top': top_position
            }, 200, 'linear');
        }
    }

})


$(function() {
    //alert($(window).height());
    $('.btn-default2').click(function() {
        $('#code2').center();
        $('#goodcover2').show();
        $('#code2').fadeIn();
    });
    $('#closebt2').click(function() {
        $('#code2').hide();
        $('#goodcover2').hide();
    });
    $('#goodcover2').click(function() {
        $('#code2').hide();
        $('#goodcover2').hide();
    });
    /*var val=$(window).height();
    var codeheight=$("#code").height();
    var topheight=(val-codeheight)/2;
    $('#code').css('top',topheight);*/
    jQuery.fn.center = function(loaded) {
        var obj = this;
        body_width = parseInt($(window).width());
        body_height = parseInt($(window).height());
        block_width = parseInt(obj.width());
        block_height = parseInt(obj.height());

        left_position = parseInt((body_width / 2) - (block_width / 2) + $(window).scrollLeft());
        if (body_width < block_width) {
            left_position = 0 + $(window).scrollLeft();
        };

        top_position = parseInt((body_height / 2) - (block_height / 2) + $(window).scrollTop());
        if (body_height < block_height) {
            top_position = 0 + $(window).scrollTop();
        };

        if (!loaded) {

            obj.css({
                'position': 'absolute'
            });
            obj.css({
                'top': ($(window).height() - $('#code2').height()) * 0.5,
                'left': left_position
            });
            $(window).bind('resize', function() {
                obj.center(!loaded);
            });
            $(window).bind('scroll', function() {
                obj.center(!loaded);
            });

        } else {
            obj.stop();
            obj.css({
                'position': 'absolute'
            });
            obj.animate({
                'top': top_position
            }, 200, 'linear');
        }
    }

})


$(function() {
    //alert($(window).height());
    $('.btn-default3').click(function() {
        $('#code3').center();
        $('#goodcover3').show();
        $('#code3').fadeIn();
    });
    $('#closebt3').click(function() {
        $('#code3').hide();
        $('#goodcover3').hide();
    });
    $('#goodcover3').click(function() {
        $('#code3').hide();
        $('#goodcover3').hide();
    });
    /*var val=$(window).height();
    var codeheight=$("#code").height();
    var topheight=(val-codeheight)/2;
    $('#code').css('top',topheight);*/
    jQuery.fn.center = function(loaded) {
        var obj = this;
        body_width = parseInt($(window).width());
        body_height = parseInt($(window).height());
        block_width = parseInt(obj.width());
        block_height = parseInt(obj.height());

        left_position = parseInt((body_width / 2) - (block_width / 2) + $(window).scrollLeft());
        if (body_width < block_width) {
            left_position = 0 + $(window).scrollLeft();
        };

        top_position = parseInt((body_height / 2) - (block_height / 2) + $(window).scrollTop());
        if (body_height < block_height) {
            top_position = 0 + $(window).scrollTop();
        };

        if (!loaded) {

            obj.css({
                'position': 'absolute'
            });
            obj.css({
                'top': ($(window).height() - $('#code3').height()) * 0.5,
                'left': left_position
            });
            $(window).bind('resize', function() {
                obj.center(!loaded);
            });
            $(window).bind('scroll', function() {
                obj.center(!loaded);
            });

        } else {
            obj.stop();
            obj.css({
                'position': 'absolute'
            });
            obj.animate({
                'top': top_position
            }, 200, 'linear');
        }
    }

})
