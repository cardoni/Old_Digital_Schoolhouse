/*
 * jQuery File Upload Plugin JS Example 6.5.1
 * https://github.com/blueimp/jQuery-File-Upload
 *
 * Copyright 2010, Sebastian Tschan
 * https://blueimp.net
 *
 * Licensed under the MIT license:
 * http://www.opensource.org/licenses/MIT
 */
/*jslint nomen: true, unparam: true, regexp: true */
/*global $, window, document */
$(function(){"use strict",$("#fileupload").fileupload(),$("#fileupload").fileupload("option","redirect",window.location.href.replace(/\/[^\/]*$/,"/cors/result.html?%s")),window.location.hostname==="blueimp.github.com"?($("#fileupload").fileupload("option",{url:"//jquery-file-upload.appspot.com/",maxFileSize:5e6,acceptFileTypes:/(\.|\/)(gif|jpe?g|png)$/i,resizeMaxWidth:1920,resizeMaxHeight:1200}),$.support.cors&&$.ajax({url:"//jquery-file-upload.appspot.com/",type:"HEAD"}).fail(function(){$('<span class="alert alert-error"/>').text("Upload server currently unavailable - "+new Date).appendTo("#fileupload")})):$("#fileupload").each(function(){var a=this;$.getJSON(this.action,function(b){b&&b.length&&$(a).fileupload("option","done").call(a,null,{result:b})})})})