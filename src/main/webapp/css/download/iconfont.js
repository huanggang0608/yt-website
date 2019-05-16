(function(window){var svgSprite='<svg><symbol id="icon-bofang" viewBox="0 0 1030 1024"><path d="M511.999996 0C229.260123 0-4.0e-06 229.238701-4.0e-06 512c0 282.782725 229.238701 512 512 512 282.782725 0 512-229.217275 512-512C1024.021422 229.238701 794.804147 0 511.999996 0zM511.999996 958.842986c-246.786743 0-446.82156-200.056244-446.82156-446.842986 0-246.786743 200.056244-446.82156 446.82156-446.82156 246.829595 0 446.842986 200.034818 446.842986 446.82156C958.864408 758.786743 758.829591 958.842986 511.999996 958.842986z"  ></path><path d="M365.102105 328.52762l85.70472 0 0 385.671242-85.70472 0 0-385.671242Z"  ></path><path d="M536.511546 328.52762l107.130901 0 0 385.671242-107.130901 0 0-385.671242Z"  ></path></symbol><symbol id="icon-xiazai" viewBox="0 0 1024 1024"><path d="M512 785.066667c-8.738133 0-17.476267-3.345067-24.1664-9.966933l-341.333333-341.333333C136.738133 423.936 133.802667 409.326933 139.127467 396.561067 144.384 383.7952 156.8768 375.466667 170.666667 375.466667L341.333333 375.466667 341.333333 68.266667c0-18.8416 15.291733-34.133333 34.133333-34.133333l273.066667 0C667.374933 34.133333 682.666667 49.425067 682.666667 68.266667l0 307.2 170.666667 0c13.789867 0 26.282667 8.328533 31.5392 21.0944s2.321067 27.4432-7.3728 37.205333l-341.333333 341.333333C529.476267 781.7216 520.738133 785.066667 512 785.066667zM253.064533 443.733333 512 702.6688 770.935467 443.733333 648.533333 443.733333C629.691733 443.733333 614.4 428.4416 614.4 409.6L614.4 102.4 409.6 102.4 409.6 409.6c0 18.8416-15.291733 34.133333-34.133333 34.133333L253.064533 443.733333zM989.866667 989.866667l-955.733333 0C15.291733 989.866667 0 974.574933 0 955.733333s15.291733-34.133333 34.133333-34.133333l955.733333 0c18.8416 0 34.133333 15.291733 34.133333 34.133333S1008.708267 989.866667 989.866667 989.866667z"  ></path></symbol><symbol id="icon-bofang1" viewBox="0 0 1024 1024"><path d="M512 967.111c-250.311 0-455.111-204.8-455.111-455.111S261.689 56.889 512 56.889 967.111 261.689 967.111 512 762.311 967.111 512 967.111z m0-56.889c221.867 0 398.222-176.355 398.222-398.222S733.867 113.778 512 113.778 113.778 290.133 113.778 512 290.133 910.222 512 910.222z" fill="#73777A" ></path><path d="M796.444 512l-455.11 227.556V284.444z" fill="#73777A" ></path></symbol><symbol id="icon-shoucang" viewBox="0 0 1024 1024"><path d="M744.8 128H279.2c-21.3 0-38.7 17.4-38.7 38.7v690.5c0 13.7 7 26.1 18.8 33.2 11.7 7.1 26 7.5 38.1 1L512 777.7l214.6 113.7c5.7 3 11.9 4.6 18.1 4.6 6.9 0 13.8-1.9 19.9-5.6 11.7-7.1 18.7-19.5 18.7-33.2V166.7c0.2-21.3-17.2-38.7-38.5-38.7z m-12 709.5L530.1 730c-11.3-6-24.9-6-36.2 0L291.2 837.5V178.6h441.7v658.9z"  ></path></symbol></svg>';var script=function(){var scripts=document.getElementsByTagName("script");return scripts[scripts.length-1]}();var shouldInjectCss=script.getAttribute("data-injectcss");var ready=function(fn){if(document.addEventListener){if(~["complete","loaded","interactive"].indexOf(document.readyState)){setTimeout(fn,0)}else{var loadFn=function(){document.removeEventListener("DOMContentLoaded",loadFn,false);fn()};document.addEventListener("DOMContentLoaded",loadFn,false)}}else if(document.attachEvent){IEContentLoaded(window,fn)}function IEContentLoaded(w,fn){var d=w.document,done=false,init=function(){if(!done){done=true;fn()}};var polling=function(){try{d.documentElement.doScroll("left")}catch(e){setTimeout(polling,50);return}init()};polling();d.onreadystatechange=function(){if(d.readyState=="complete"){d.onreadystatechange=null;init()}}}};var before=function(el,target){target.parentNode.insertBefore(el,target)};var prepend=function(el,target){if(target.firstChild){before(el,target.firstChild)}else{target.appendChild(el)}};function appendSvg(){var div,svg;div=document.createElement("div");div.innerHTML=svgSprite;svgSprite=null;svg=div.getElementsByTagName("svg")[0];if(svg){svg.setAttribute("aria-hidden","true");svg.style.position="absolute";svg.style.width=0;svg.style.height=0;svg.style.overflow="hidden";prepend(svg,document.body)}}if(shouldInjectCss&&!window.__iconfont__svg__cssinject__){window.__iconfont__svg__cssinject__=true;try{document.write("<style>.svgfont {display: inline-block;width: 1em;height: 1em;fill: currentColor;vertical-align: -0.1em;font-size:16px;}</style>")}catch(e){console&&console.log(e)}}ready(appendSvg)})(window)