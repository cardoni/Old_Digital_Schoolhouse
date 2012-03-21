/*
 * jQuery postMessage Transport Plugin 1.1
 * https://github.com/blueimp/jQuery-File-Upload
 *
 * Copyright 2011, Sebastian Tschan
 * https://blueimp.net
 *
 * Licensed under the MIT license:
 * http://www.opensource.org/licenses/MIT
 */
/*jslint unparam: true, nomen: true */
/*global define, window, document */
(function(a){"use strict",typeof define=="function"&&define.amd?define(["jquery"],a):a(window.jQuery)})(function(a){"use strict";var b=0,c=["accepts","cache","contents","contentType","crossDomain","data","dataType","headers","ifModified","mimeType","password","processData","timeout","traditional","type","url","username"],d=function(a){return a};a.ajaxSetup({converters:{"postmessage text":d,"postmessage json":d,"postmessage html":d}}),a.ajaxTransport("postmessage",function(d){if(d.postMessage&&window.postMessage){var e,f=a("<a>").prop("href",d.postMessage)[0],g=f.protocol+"//"+f.host,h=d.xhr().upload;return{send:function(f,i){var j={id:"postmessage-transport-"+(b+=1)},k="message."+j.id;e=a('<iframe style="display:none;" src="'+d.postMessage+'" name="'+j.id+'"></iframe>').bind("load",function(){a.each(c,function(a,b){j[b]=d[b]}),j.dataType=j.dataType.replace("postmessage ",""),a(window).bind(k,function(b){b=b.originalEvent;var c=b.data,d;b.origin===g&&c.id===j.id&&(c.type==="progress"?(d=document.createEvent("Event"),d.initEvent(c.type,!1,!0),a.extend(d,c),h.dispatchEvent(d)):(i(c.status,c.statusText,{postmessage:c.result},c.headers),e.remove(),a(window).unbind(k)))}),e[0].contentWindow.postMessage(j,g)}).appendTo(document.body)},abort:function(){e&&e.remove()}}}})})