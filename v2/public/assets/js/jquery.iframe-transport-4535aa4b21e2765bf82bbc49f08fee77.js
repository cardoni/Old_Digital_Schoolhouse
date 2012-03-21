/*
 * jQuery Iframe Transport Plugin 1.3
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
(function(a){"use strict",typeof define=="function"&&define.amd?define(["jquery"],a):a(window.jQuery)})(function(a){"use strict";var b=0;a.ajaxTransport("iframe",function(c){if(c.async&&(c.type==="POST"||c.type==="GET")){var d,e;return{send:function(f,g){d=a('<form style="display:none;"></form>'),e=a('<iframe src="javascript:false;" name="iframe-transport-'+(b+=1)+'"></iframe>').bind("load",function(){var b;e.unbind("load").bind("load",function(){var b;try{b=e.contents();if(!b.length||!b[0].firstChild)throw new Error}catch(c){b=undefined}g(200,"success",{iframe:b}),a('<iframe src="javascript:false;"></iframe>').appendTo(d),d.remove()}),d.prop("target",e.prop("name")).prop("action",c.url).prop("method",c.type),c.formData&&a.each(c.formData,function(b,c){a('<input type="hidden"/>').prop("name",c.name).val(c.value).appendTo(d)}),c.fileInput&&c.fileInput.length&&c.type==="POST"&&(b=c.fileInput.clone(),c.fileInput.after(function(a){return b[a]}),c.paramName&&c.fileInput.each(function(){a(this).prop("name",c.paramName)}),d.append(c.fileInput).prop("enctype","multipart/form-data").prop("encoding","multipart/form-data")),d.submit(),b&&b.length&&c.fileInput.each(function(c,d){var e=a(b[c]);a(d).prop("name",e.prop("name")),e.replaceWith(d)})}),d.append(e).appendTo(document.body)},abort:function(){e&&e.unbind("load").prop("src","javascript".concat(":false;")),d&&d.remove()}}}}),a.ajaxSetup({converters:{"iframe text":function(b){return a(b[0].body).text()},"iframe json":function(b){return a.parseJSON(a(b[0].body).text())},"iframe html":function(b){return a(b[0].body).html()},"iframe script":function(b){return a.globalEval(a(b[0].body).text())}}})})