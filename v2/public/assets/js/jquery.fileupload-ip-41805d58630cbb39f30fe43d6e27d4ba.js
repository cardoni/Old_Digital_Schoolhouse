/*
 * jQuery File Upload Image Processing Plugin 1.0.6
 * https://github.com/blueimp/jQuery-File-Upload
 *
 * Copyright 2012, Sebastian Tschan
 * https://blueimp.net
 *
 * Licensed under the MIT license:
 * http://www.opensource.org/licenses/MIT
 */
/*jslint nomen: true, unparam: true, regexp: true */
/*global define, window, document */
(function(a){"use strict",typeof define=="function"&&define.amd?define(["jquery","load-image","canvas-to-blob","./jquery.fileupload"],a):a(window.jQuery,window.loadImage,window.canvasToBlob)})(function(a,b,c){"use strict",a.widget("blueimpIP.fileupload",a.blueimp.fileupload,{options:{resizeSourceFileTypes:/^image\/(gif|jpeg|png)$/,resizeSourceMaxFileSize:2e7,resizeMaxWidth:undefined,resizeMaxHeight:undefined,resizeMinWidth:undefined,resizeMinHeight:undefined,add:function(b,c){a(this).fileupload("resize",c).done(function(){c.submit()})}},_resizeImage:function(d,e,f){var g=this,h=d[e],i=a.Deferred(),j,k;return f=f||this.options,b(h,function(a){var k=a.width,l=a.height;j=b.scale(a,{maxWidth:f.resizeMaxWidth,maxHeight:f.resizeMaxHeight,minWidth:f.resizeMinWidth,minHeight:f.resizeMinHeight,canvas:!0}),k!==j.width||l!==j.height?c(j,function(a){a.name||(h.type===a.type?a.name=h.name:h.name&&(a.name=h.name.replace(/\..+$/,"."+a.type.substr(6)))),d[e]=a,i.resolveWith(g)},h):i.resolveWith(g)}),i.promise()},resize:function(b){var c=this,d=a.extend({},this.options,b),e=a.type(d.resizeSourceMaxFileSize)!=="number",f=this._isXHRUpload(d);return a.each(b.files,function(g,h){f&&c._resizeSupport&&(d.resizeMaxWidth||d.resizeMaxHeight||d.resizeMinWidth||d.resizeMinHeight)&&(e||h.size<d.resizeSourceMaxFileSize)&&d.resizeSourceFileTypes.test(h.type)&&(c._processing+=1,c._processing===1&&c.element.addClass("fileupload-processing"),c._processingQueue=c._processingQueue.pipe(function(){var e=a.Deferred();return c._resizeImage(b.files,g,d).done(function(){c._processing-=1,c._processing===0&&c.element.removeClass("fileupload-processing"),e.resolveWith(c)}),e.promise()}))}),this._processingQueue},_create:function(){a.blueimp.fileupload.prototype._create.call(this),this._processing=0,this._processingQueue=a.Deferred().resolveWith(this).promise(),this._resizeSupport=c&&c(document.createElement("canvas"),a.noop)}})})