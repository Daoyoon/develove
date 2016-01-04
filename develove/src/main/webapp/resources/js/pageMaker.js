/**
 * 
 */
function makePage(criteria){

    var startPage, endPage, prev, next;
    var str = "";

    var pageNo = criteria.pageNo;
    var perPageNum = criteria.perPageNum;
    var perPage = criteria.perPage;
    endPage = Math.ceil(pageNo/perPageNum)*(perPageNum);

    startPage = endPage - perPageNum + 1;

    var tempLast = Math.ceil(criteria.totalCount/perPage);

    endPage = tempLast < endPage ? tempLast:endPage;

    console.log(startPage, endPage, tempLast)

    prev = (startPage > 1) ? true:false;
    next = tempLast > endPage ? true:false;

    if(prev){
    	 str+= "<li><a href="+(startPage-1)+"> << </a></li>"
    }
    for(var i = startPage; i <= endPage; i++){
    	 str+= "<li><a href="+i+">"+i+ "</a></li>"
    }
    if(next){
    	str+= "<li><a href="+(endPage+1)+"> >> </a></li>"
    }
    console.log(str);
    console.log("aaaaaa");
    return str;
}