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

