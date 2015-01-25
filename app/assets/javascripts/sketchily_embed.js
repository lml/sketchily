//= require svg-edit/embedapi
//= require sketchily/base64

var svgCanvas = svgCanvas || {};

function submitHandler(event) {
  var id = event.data;
  svgCanvas[id].getSvgString()(function (data, error) {
    handleSvgData(data, error, id);
  });
  event.preventDefault();
  event.stopImmediatePropagation();
}

function attachSubmitHandler(event) {
  var id = event.data;
  $("input#" + id).closest("form").on("submit.svgedit_" + id, null, id, submitHandler);
}

function handleSvgData(data, error, id) {
  if (error) {
    alert('Error: ' + error);
  }
  else {
    var input = $("input#" + id);
    var form = input.closest("form");
    input.attr("value", sketchily_encode64("<?xml version=\"1.0\"?>\n" + data));
    form.off("submit.svgedit_" + id);
    form.one("submit.svgedit_" + id, null, id, attachSubmitHandler);
    form.submit();
  }
}

function initEmbed(id, value, hide_menu, hide_image_tool, show_hyperlink_tool, url) {
  var frame = document.getElementById("svgedit_" + id);
  svgCanvas[id] = new embedded_svg_edit(frame);

  var doc = frame.contentDocument;
  if (!doc) {
    doc = frame.contentWindow.document;
  }

  if (hide_menu) {
    var mainButton = doc.getElementById('main_button');
    mainButton.parentNode.removeChild(mainButton);
    var toolsTop = doc.getElementById('tools_top');
    toolsTop.style.left = '5px';
  }

  if (hide_image_tool) {
    var imageTool = doc.getElementById('tool_image');
    imageTool.parentNode.removeChild(imageTool);
  }

  if (!show_hyperlink_tool) {
    var hyperlinkTool = doc.getElementById('tool_make_link');
    hyperlinkTool.parentNode.removeChild(hyperlinkTool);
  }

  if (!url) {
    svgCanvas[id].setSvgString(sketchily_decode64(value));
  }

  $("input#" + id).closest("form").on("submit.svgedit_" + id, null, id, submitHandler);

  $("#svgedit_" + id).css('visibility', '');
}

function attachLoadHandler(id, value, hide_menu, hide_image_tool, show_hyperlink_tool, url) {
  var frame = $("#svgedit_" + id);
  if (frame.attr('src')) {
    frame.load(function () {
      initEmbed(id, value, hide_menu, hide_image_tool, show_hyperlink_tool, url);
    });
  }
  else {
    setTimeout(function () {
      attachLoadHandler(id, value, hide_menu, hide_image_tool, show_hyperlink_tool, url);
    }, 0);
  }
}
