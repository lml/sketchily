// This code was written by Tyler Akins and has been placed in the
// public domain.  It would be nice if you left this header intact.
// Base64 code from Tyler Akins -- http://rumkin.com

// schiller: Removed string concatenation in favour of Array.join()
// optimization, also precalculate the size of the array needed.

(function (sketchily, $, undefined) {

  // Function: encode64
  // Converts a string to base64
  sketchily.encode64 = function(input) {
    // base64 strings are 4/3 larger than the original string
    input = convertToXMLReferences(input);
    if(window.btoa) return window.btoa(input); // Use native if available
    var output = new Array( Math.floor( (input.length + 2) / 3 ) * 4 );
    var chr1, chr2, chr3;
    var enc1, enc2, enc3, enc4;
    var i = 0, p = 0;

    do {
	    chr1 = input.charCodeAt(i++);
	    chr2 = input.charCodeAt(i++);
	    chr3 = input.charCodeAt(i++);

	    enc1 = chr1 >> 2;
	    enc2 = ((chr1 & 3) << 4) | (chr2 >> 4);
	    enc3 = ((chr2 & 15) << 2) | (chr3 >> 6);
	    enc4 = chr3 & 63;

	    if (isNaN(chr2)) {
		    enc3 = enc4 = 64;
	    } else if (isNaN(chr3)) {
		    enc4 = 64;
	    }

	    output[p++] = KEYSTR.charAt(enc1);
	    output[p++] = KEYSTR.charAt(enc2);
	    output[p++] = KEYSTR.charAt(enc3);
	    output[p++] = KEYSTR.charAt(enc4);
    } while (i < input.length);

    return output.join('');
  };

  // Function: decode64
  // Converts a string from base64
  sketchily.decode64 = function(input) {
    if(window.atob) return window.atob(input);
    var output = "";
    var chr1, chr2, chr3 = "";
    var enc1, enc2, enc3, enc4 = "";
    var i = 0;

     // remove all characters that are not A-Z, a-z, 0-9, +, /, or =
     input = input.replace(/[^A-Za-z0-9\+\/\=]/g, "");

     do {
	    enc1 = KEYSTR.indexOf(input.charAt(i++));
	    enc2 = KEYSTR.indexOf(input.charAt(i++));
	    enc3 = KEYSTR.indexOf(input.charAt(i++));
	    enc4 = KEYSTR.indexOf(input.charAt(i++));

	    chr1 = (enc1 << 2) | (enc2 >> 4);
	    chr2 = ((enc2 & 15) << 4) | (enc3 >> 2);
	    chr3 = ((enc3 & 3) << 6) | enc4;

	    output = output + String.fromCharCode(chr1);

	    if (enc3 != 64) {
	      output = output + String.fromCharCode(chr2);
	    }
	    if (enc4 != 64) {
	      output = output + String.fromCharCode(chr3);
	    }

	    chr1 = chr2 = chr3 = "";
	    enc1 = enc2 = enc3 = enc4 = "";

     } while (i < input.length);
     return unescape(output);
  };

  // Function:convertToXMLReferences
  // Converts a string to use XML references
  function convertToXMLReferences(input) {
	  var output = '';
	  for (var n = 0; n < input.length; n++){
		  var c = input.charCodeAt(n);
		  if (c < 128) {
			  output += input[n];
		  } else if(c > 127) {
			  output += ("&#" + c + ";");
		  }
	  }
	  return output;
  };

}(window.sketchily = window.sketchily || {}, jQuery));

