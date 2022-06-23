"use strict";!function($){let $html=document.querySelector("html");var droitDarkMOde={init:function(){droitDarkMOde.drdtSwitchButton(),droitDarkMOde.drdtBackgroundDisable(),droitDarkMOde.hardCodeExl(),droitDarkMOde.drdtHandleExcludes(),droitDarkMOde.drdtHandleIncludes(),window.addEventListener("DroitDarkModeInit",droitDarkMOde.checkDarkMode),droitDarkMOde.drdtImageReplace(),droitDarkMOde.DrdtcheckOsMode()},drdtBackgroundDisable:function(){document.querySelectorAll("header, footer, div, section").forEach((function(e){if(e){var t=window.getComputedStyle(e,!1).backgroundImage,n=e.getAttribute("data-jarallax-original-styles");("none"!==t||n)&&(e.classList.add("drdt-ignore-dark"),e.querySelectorAll("*").forEach((function(el){return el.classList.add("drdt-ignore-dark")})))}}))},drdtSwitchButton:function(){let $dtdrbutton=document.querySelectorAll(".dark_switch_box");if($dtdrbutton)for(let $i=0;$i<$dtdrbutton.length;$i++){let $self=$dtdrbutton[$i];$self&&("yes"==dtdr_settings.mode&&"yes"==dtdr_settings.default&&$self.classList.toggle("active"),$self.addEventListener("click",(function($ev){let $this=this;var getPublic;$html.classList.toggle("drdt-dark-mode"),$html.classList.toggle(dtdr_settings.colorset),this.classList.toggle("active"),drdt_setCookie("drdt_dark_public","yes"==drdt_getCookie("drdt_dark_public")?"no":"yes",365),droitDarkMOde.drdtImageReplace()})))}},DrdtcheckOsMode:function(){if("yes"==dtdr_settings.os_based){var e=window.matchMedia("(prefers-color-scheme: dark)");try{e.addEventListener("change",(function(e){"dark"==(e.matches?"dark":"light")?document.querySelector("html").classList.add("drdt-dark-mode"):document.querySelector("html").classList.remove("drdt-dark-mode"),window.dispatchEvent(new Event("DroitDarkModeInit"))}))}catch(t){try{e.addListener((function(e){"dark"==(e.matches?"dark":"light")?document.querySelector("html").classList.add("drdt-dark-mode"):document.querySelector("html").classList.remove("drdt-dark-mode"),window.dispatchEvent(new Event("DroitDarkModeInit"))}))}catch(e){console.error(e)}}window.matchMedia&&window.matchMedia("(prefers-color-scheme: dark)").matches&&(document.querySelector("html").classList.add("drdt-dark-mode"),window.dispatchEvent(new Event("DroitDarkModeInit")))}},checkDarkMode:function(){let $this=this;$html.classList.toggle(dtdr_settings.colorset);var $dtdrbutton=document.querySelectorAll(".dark_switch_box"),getPublic;for(let $i=0;$i<$dtdrbutton.length;$i++){let $self=$dtdrbutton[$i];$self&&$self.classList.toggle("active")}drdt_setCookie("drdt_dark_public","yes"==drdt_getCookie("drdt_dark_public")?"no":"yes",365),droitDarkMOde.drdtImageReplace()},drdtHandleExcludes:function(){""!=dtdr_settings.excludes&&document.querySelectorAll(dtdr_settings.excludes).forEach((function(e){e&&(e.classList.add("drdt-ignore-dark"),e.querySelectorAll("*").forEach((function(e1){e1.classList.add("drdt-ignore-dark")})))}))},drdtHandleIncludes:function(){""!=dtdr_settings.includes&&document.querySelectorAll(dtdr_settings.includes).forEach((function(e){e&&(e.classList.remove("drdt-ignore-dark"),e.querySelectorAll("*").forEach((function(e1){e1.classList.remove("drdt-ignore-dark")})))}))},drdtImageReplace:function(){var $replace=JSON.parse(dtdr_settings.replace),getPublic=drdt_getCookie("drdt_dark_public");$replace.length>0&&$replace.forEach((function($k){var $normal=$k.normal?$k.normal:"",$dark=$k.dark?$k.dark:"";if("yes"==getPublic)var $find=$normal,$rep=$dark;else var $find=$dark,$rep=$normal;if(""!==$rep){var $image=document.querySelectorAll('img[src*="'+$find+'"]');$image&&$image.forEach((function($m){$m.setAttribute("src",$rep),$m.setAttribute("srcset",$rep)}))}}))},hardCodeExl:function(){var $exClass=document.querySelectorAll(".drdt-ignore-dark");$exClass&&$exClass.forEach((function(e){e&&e.querySelectorAll(":not(.drdt-ignore-dark)").forEach((function(e1){e1.classList.add("drdt-ignore-dark")}))}))}};function drdt_setCookie(cname,cvalue,exdays){var d=new Date;d.setTime(d.getTime()+24*exdays*60*60*1e3);var expires="expires="+d.toUTCString();document.cookie=cname+"="+cvalue+";"+expires+";path=/"}function drdt_getCookie(cname){for(var name=cname+"=",ca=document.cookie.split(";"),i=0;i<ca.length;i++){for(var c=ca[i];" "==c.charAt(0);)c=c.substring(1);if(0==c.indexOf(name))return c.substring(name.length,c.length)}return""}$html&&"yes"==dtdr_settings.mode&&"yes"==dtdr_settings.default&&($html.classList.add("drdt-dark-mode"),$html.classList.add(dtdr_settings.colorset),drdt_setCookie("drdt_dark_public","yes",365),droitDarkMOde.drdtImageReplace()),"yes"==dtdr_settings.mode&&"remove"==dtdr_settings.default&&drdt_setCookie("drdt_dark_public","no",365),document.addEventListener("DOMContentLoaded",droitDarkMOde.init)}(jQuery)
;