// 課題 JS-1: 関数 `parseLTSVLog` を記述してください

function parseLTSVLog(str){

    var array = new Array();
    var obj= new Object();
    var eachRow = str.split(/\n/);
    var rowElement = new Array();
    for(i=0 ; i < eachRow.length ; i++){
        if(eachRow[i]==="")break;
        rowElement = eachRow[i].split(/\t/);
        obj={};
        for(j=0 ; j<rowElement.length ; j++){
            var keyValue = rowElement[j].split(':');
            if(isFinite(keyValue[1])){
                obj[keyValue[0]] = parseInt(keyValue[1]);
            }else{
                obj[keyValue[0]] = keyValue[1];
            }
        }
        array[i] = obj;
    }
    return array;

};
// 課題 JS-2: 関数 `createLogTable` を記述してください

function createLogTable(target,parse){
    var table = document.createElement('table');
    var newThead = "<thead><tr><th>path</th><th>epoch</th></tr></thead>"

        var newBody="";
    for(i=0;i<parse.length;i++){
        newBody+="<tr>";
        obj = parse[i];
        for(var key in obj){
            newBody+="<td>";
            newBody+=obj[key];
            newBody+="</td>";
        }
        newBody+="</tr>";
    }
    table.innerHTML = newThead + "<tbody>" + newBody + "</tbody>";
    target.appendChild(table);
};
