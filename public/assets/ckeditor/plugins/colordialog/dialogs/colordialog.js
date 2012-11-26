/*
Copyright (c) 2003-2012, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/
CKEDITOR.dialog.add("colordialog",function(e){function u(){n.getById(w).removeStyle("background-color"),i.getContentElement("picker","selectedColor").setValue(""),o&&o.removeAttribute("aria-selected"),o=null}function a(e){var t=e.data.getTarget(),n;t.getName()=="td"&&(n=t.getChild(0).getHtml())&&(o=t,o.setAttribute("aria-selected",!0),i.getContentElement("picker","selectedColor").setValue(n))}function f(e){e=e.replace(/^#/,"");for(var t=0,n=[];t<=2;t++)n[t]=parseInt(e.substr(t*2,2),16);var r=.2126*n[0]+.7152*n[1]+.0722*n[2];return"#"+(r>=165?"000":"fff")}function h(e){!e.name&&(e=new CKEDITOR.event(e));var t=!/mouse/.test(e.name),r=e.data.getTarget(),i;r.getName()=="td"&&(i=r.getChild(0).getHtml())&&(d(e),t?l=r:c=r,t&&(r.setStyle("border-color",f(i)),r.setStyle("border-style","dotted")),n.getById(y).setStyle("background-color",i),n.getById(b).setHtml(i))}function p(){var e=l.getChild(0).getHtml();l.setStyle("border-color",e),l.setStyle("border-style","solid"),n.getById(y).removeStyle("background-color"),n.getById(b).setHtml("&nbsp;"),l=null}function d(e){var t=!/mouse/.test(e.name),r=t&&l;if(r){var i=r.getChild(0).getHtml();r.setStyle("border-color",i),r.setStyle("border-style","solid")}!l&&!c&&(n.getById(y).removeStyle("background-color"),n.getById(b).setHtml("&nbsp;"))}function v(t){var n=t.data,r=n.getTarget(),i,s,o=n.getKeystroke(),u=e.lang.dir=="rtl";switch(o){case 38:if(i=r.getParent().getPrevious())s=i.getChild([r.getIndex()]),s.focus();n.preventDefault();break;case 40:if(i=r.getParent().getNext())s=i.getChild([r.getIndex()]),s&&s.type==1&&s.focus();n.preventDefault();break;case 32:case 13:a(t),n.preventDefault();break;case u?37:39:if(s=r.getNext())s.type==1&&(s.focus(),n.preventDefault(!0));else if(i=r.getParent().getNext())s=i.getChild([0]),s&&s.type==1&&(s.focus(),n.preventDefault(!0));break;case u?39:37:if(s=r.getPrevious())s.focus(),n.preventDefault(!0);else if(i=r.getParent().getPrevious())s=i.getLast(),s.focus(),n.preventDefault(!0);break;default:return}}function m(){function n(n,r){for(var s=n;s<n+3;s++){var o=new t(E.$.insertRow(-1));o.setAttribute("role","row");for(var u=r;u<r+3;u++)for(var a=0;a<6;a++)i(o.$,"#"+e[u]+e[a]+e[s])}}function i(e,n){var r=new t(e.insertCell(-1));r.setAttribute("class","ColorCell"),r.setAttribute("tabIndex",-1),r.setAttribute("role","gridcell"),r.on("keydown",v),r.on("click",a),r.on("focus",h),r.on("blur",d),r.setStyle("background-color",n),r.setStyle("border","1px solid "+n),r.setStyle("width","14px"),r.setStyle("height","14px");var i=g("color_table_cell");r.setAttribute("aria-labelledby",i),r.append(CKEDITOR.dom.element.createFromHtml('<span id="'+i+'" class="cke_voice_label">'+n+"</span>",CKEDITOR.document))}E=CKEDITOR.dom.element.createFromHtml('<table tabIndex="-1" aria-label="'+r.options+'"'+' role="grid" style="border-collapse:separate;" cellspacing="0">'+'<caption class="cke_voice_label">'+r.options+"</caption>"+'<tbody role="presentation"></tbody></table>'),E.on("mouseover",h),E.on("mouseout",d);var e=["00","33","66","99","cc","ff"];n(0,0),n(3,0),n(0,3),n(3,3);var s=new t(E.$.insertRow(-1));s.setAttribute("role","row");for(var o=0;o<6;o++)i(s.$,"#"+e[o]+e[o]+e[o]);for(var u=0;u<12;u++)i(s.$,"#000000")}var t=CKEDITOR.dom.element,n=CKEDITOR.document,r=e.lang.colordialog,i,s={type:"html",html:"&nbsp;"},o,l,c,g=function(e){return CKEDITOR.tools.getNextId()+"_"+e},y=g("hicolor"),b=g("hicolortext"),w=g("selhicolor"),E;return m(),{title:r.title,minWidth:360,minHeight:220,onLoad:function(){i=this},onHide:function(){u(),p()},contents:[{id:"picker",label:r.title,accessKey:"I",elements:[{type:"hbox",padding:0,widths:["70%","10%","30%"],children:[{type:"html",html:"<div></div>",onLoad:function(){CKEDITOR.document.getById(this.domId).append(E)},focus:function(){(l||this.getElement().getElementsByTag("td").getItem(0)).focus()}},s,{type:"vbox",padding:0,widths:["70%","5%","25%"],children:[{type:"html",html:"<span>"+r.highlight+'</span>												<div id="'+y+'" style="border: 1px solid; height: 74px; width: 74px;"></div>												<div id="'+b+'">&nbsp;</div><span>'+r.selected+'</span>												<div id="'+w+'" style="border: 1px solid; height: 20px; width: 74px;"></div>'},{type:"text",label:r.selected,labelStyle:"display:none",id:"selectedColor",style:"width: 74px",onChange:function(){try{n.getById(w).setStyle("background-color",this.getValue())}catch(e){u()}}},s,{type:"button",id:"clear",style:"margin-top: 5px",label:r.clear,onClick:u}]}]}]}]}});