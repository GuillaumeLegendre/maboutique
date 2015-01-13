(function(f){"function"===typeof define&&define.amd?define(["jquery","./jquery.inputmask"],f):f(jQuery)})(function(f){f.extend(f.inputmask.defaults.aliases,{numeric:{mask:function(a){0!==a.repeat&&isNaN(a.integerDigits)&&(a.integerDigits=a.repeat);a.repeat=0;a.autoGroup=a.autoGroup&&""!=a.groupSeparator;if(a.autoGroup&&isFinite(a.integerDigits)){var b=Math.floor(a.integerDigits/a.groupSize);a.integerDigits+=0==a.integerDigits%a.groupSize?b-1:b}a.definitions[":"].placeholder=a.radixPoint;b=a.prefix;
b=b+"[+]"+("~{1,"+a.integerDigits+"}");void 0!=a.digits&&(isNaN(a.digits)||0<parseInt(a.digits))&&(b=a.digitsOptional?b+("[:~{"+a.digits+"}]"):b+(":~{"+a.digits+"}"));return b+=a.suffix},placeholder:"",greedy:!1,digits:"*",digitsOptional:!0,groupSeparator:"",radixPoint:".",groupSize:3,autoGroup:!1,allowPlus:!0,allowMinus:!0,integerDigits:"+",prefix:"",suffix:"",rightAlign:!0,postFormat:function(a,b,d,c){var e=!1,h=a[b];if(""==c.groupSeparator||-1!=f.inArray(c.radixPoint,a)&&b>=f.inArray(c.radixPoint,
a)||/[-+]/.test(h))return{pos:b};var g=a.slice();h==c.groupSeparator&&(g.splice(b--,1),h=g[b]);d?g[b]="?":g.splice(b,0,"?");b=g.join("");if(c.autoGroup||d&&-1!=b.indexOf(c.groupSeparator)){g=f.inputmask.escapeRegex.call(this,c.groupSeparator);e=0==b.indexOf(c.groupSeparator);b=b.replace(RegExp(g,"g"),"");g=b.split(c.radixPoint);b=g[0];if(b!=c.prefix+"?0"&&b.length>=c.groupSize+c.prefix.length)for(var e=!0,k=RegExp("([-+]?[\\d?]+)([\\d?]{"+c.groupSize+"})");k.test(b);)b=b.replace(k,"$1"+c.groupSeparator+
"$2"),b=b.replace(c.groupSeparator+c.groupSeparator,c.groupSeparator);1<g.length&&(b+=c.radixPoint+g[1])}a.length=b.length;c=0;for(g=b.length;c<g;c++)a[c]=b.charAt(c);c=f.inArray("?",a);d?a[c]=h:a.splice(c,1);return{pos:c,refreshFromBuffer:e}},onKeyDown:function(a,b,d,c){if(a.keyCode==c.keyCode.TAB&&"0"!=c.placeholder.charAt(0)){if(a=f.inArray(c.radixPoint,b),-1!=a&&isFinite(c.digits)){for(d=1;d<=c.digits;d++)if(void 0==b[a+d]||b[a+d]==c.placeholder.charAt(0))b[a+d]="0";return{refreshFromBuffer:{start:++a,
end:a+c.digits}}}}else if(c.autoGroup&&(a.keyCode==c.keyCode.DELETE||a.keyCode==c.keyCode.BACKSPACE))return b=c.postFormat(b,d-1,!0,c),b.caret=b.pos+1,b},onKeyPress:function(a,b,d,c){if(c.autoGroup)return a=c.postFormat(b,d-1,!0,c),a.caret=a.pos+1,a},regex:{integerPart:function(a){return/[-+]?\d+/}},negationhandler:function(a,b,d,c,e){return!c&&e.allowMinus&&"-"===a&&(a=b.join("").match(e.regex.integerPart(e)),0<a.length)?"+"==b[a.index]?{pos:a.index,c:"-",remove:a.index,caret:d}:"-"==b[a.index]?
{remove:a.index,caret:d-1}:{pos:a.index,c:"-",caret:d+1}:!1},definitions:{"~":{validator:function(a,b,d,c,e){var h=e.negationhandler(a,b.buffer,d,c,e);if(!h&&(h=c?RegExp("[0-9"+f.inputmask.escapeRegex.call(this,e.groupSeparator)+"]").test(a):/[0-9]/.test(a),!0===h&&(h={pos:d}),!1!=h&&!c)){c=b.buffer.join("").match(e.regex.integerPart(e));var g=f.inArray(e.radixPoint,b.buffer);if(c)if(0==c["0"].indexOf("0")&&d>=e.prefix.length)-1==g||d<=g&&void 0==b.validPositions[g]?(b.buffer.splice(c.index,1),d=
d>c.index?d-1:c.index,f.extend(h,{pos:d,remove:c.index})):d>c.index&&d<=g&&(b.buffer.splice(c.index,1),d=d>c.index?d-1:c.index,f.extend(h,{pos:d,remove:c.index}));else if("0"==a&&d<=c.index)return!1;if(!1===e.digitsOptional&&d>g)return{pos:d,remove:d}}return h},cardinality:1,prevalidator:null},"+":{validator:function(a,b,d,c,e){b="[";!0===e.allowMinus&&(b+="-");!0===e.allowPlus&&(b+="+");return RegExp(b+"]").test(a)},cardinality:1,prevalidator:null,placeholder:""},":":{validator:function(a,b,d,c,
e){c=e.negationhandler(a,b.buffer,d,c,e);c||(c="["+f.inputmask.escapeRegex.call(this,e.radixPoint)+"]",(c=RegExp(c).test(a))&&b.validPositions[d]&&b.validPositions[d].match.placeholder==e.radixPoint&&(c={pos:d,remove:d}));return c},cardinality:1,prevalidator:null,placeholder:""}},insertMode:!0,autoUnmask:!1,onUnMask:function(a,b,d){a=a.replace(d.prefix,"");a=a.replace(d.suffix,"");return a=a.replace(RegExp(f.inputmask.escapeRegex.call(this,d.groupSeparator),"g"),"")},isComplete:function(a,b){var d=
a.join(""),c=a.slice();b.postFormat(c,0,!0,b);if(c.join("")!=d)return!1;d=d.replace(b.prefix,"");d=d.replace(b.suffix,"");d=d.replace(RegExp(f.inputmask.escapeRegex.call(this,b.groupSeparator),"g"),"");d=d.replace(f.inputmask.escapeRegex.call(this,b.radixPoint),".");return isFinite(d)},onBeforeMask:function(a,b){if(isFinite(a))return a.toString().replace(".",b.radixPoint);var d=a.match(/,/g),c=a.match(/\./g);c&&d?c.length>d.length?(a=a.replace(/\./g,""),a=a.replace(",",b.radixPoint)):d.length>c.length&&
(a=a.replace(/,/g,""),a=a.replace(".",b.radixPoint)):a=a.replace(RegExp(f.inputmask.escapeRegex.call(this,b.groupSeparator),"g"),"");return a}},decimal:{alias:"numeric"},integer:{alias:"numeric",digits:"0"}})});
