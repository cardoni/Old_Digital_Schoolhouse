/*
 * jQuery XDomainRequest Transport Plugin 1.1.2
 * https://github.com/blueimp/jQuery-File-Upload
 *
 * Copyright 2011, Sebastian Tschan
 * https://blueimp.net
 *
 * Licensed under the MIT license:
 * http://www.opensource.org/licenses/MIT
 *
 * Based on Julian Aubourg's ajaxHooks xdr.js:
 * https://github.com/jaubourg/ajaxHooks/
 */
/*jslint unparam: true */
/*global define, window, XDomainRequest */
(function(a){"use strict",typeof define=="function"&&define.amd?define(["jquery"],a):a(window.jQuery)})(function(a){"use strict",window.XDomainRequest&&!a.support.cors&&a.ajaxTransport(function(b){if(b.crossDomain&&b.async){b.timeout&&(b.xdrTimeout=b.timeout,delete b.timeout);var c;return{send:function(d,e){function f(b,d,f,g){c.onload=c.onerror=c.ontimeout=a.noop,c=null,e(b,d,f,g)}c=new XDomainRequest,b.type==="DELETE"?(b.url=b.url+(/\?/.test(b.url)?"&":"?")+"_method=DELETE",b.type="POST"):b.type==="PUT"&&(b.url=b.url+(/\?/.test(b.url)?"&":"?")+"_method=PUT",b.type="POST"),c.open(b.type,b.url),c.onload=function(){f(200,"OK",{text:c.responseText},"Content-Type: "+c.contentType)},c.onerror=function(){f(404,"Not Found")},b.xdrTimeout&&(c.ontimeout=function(){f(0,"timeout")},c.timeout=b.xdrTimeout),c.send(b.hasContent&&b.data||null)},abort:function(){c&&(c.onerror=a.noop(),c.abort())}}}})})