//= require svg-edit/embedapi
//= require sketchily/base64

(function (sketchily, $, undefined) {

  sketchily.svgCanvas = sketchily.svgCanvas || {};

  // Prevents normal form submission
  // Instead, fetches the SVG data from svgEdit
  function submitHandler(event) {
    var id = event.data;
    sketchily.svgCanvas[id].getSvgString()(function (data, error) {
      handleSvgData(data, error, id);
    });
    event.preventDefault();
    event.stopImmediatePropagation();

    // Workaround for the fact that svgCanvas.setConfig() seems to be broken
    sketchily.svgCanvas[id].frame.contentWindow.svgEditor.showSaveWarning = false;
  }

  // Attaches the submitHandler function to the form's submit button
  function attachSubmitHandler(event) {
    var id = event.data;
    $("input#" + id).closest("form")
                    .on("submit.svgedit_" + id, null, id, submitHandler);
  }

  // Adds the data from svgEdit to the proper form element
  // Disables Sketchily's submit handler
  // Attaches a handler that will reenable the previous handler after 1 submit
  // (in case the user uses the back button to return to the form)
  // Resubmits the form
  function handleSvgData(data, error, id) {
    if (error) {
      alert('Error: ' + error);
    }
    else {
      var input = $("input#" + id);
      var form = input.closest("form");
      input.attr("value", sketchily.encode64("<?xml version=\"1.0\"?>\n"
                                             + data));
      form.off("submit.svgedit_" + id);
      form.one("submit.svgedit_" + id, null, id, attachSubmitHandler);
      form.submit();
    }
  }

  // Initializes svgEdit with Sketchily's configuration
  function initEmbed(id, value,
                     hide_menu, hide_image_tool, show_hyperlink_tool,
                     url) {
    var frame = document.getElementById("svgedit_" + id);
    sketchily.svgCanvas[id] = new embedded_svg_edit(frame);

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
      sketchily.svgCanvas[id].setSvgString(sketchily.decode64(value));
    }

    $("input#" + id).closest("form")
                    .on("submit.svgedit_" + id, null, id, submitHandler);

    $("#svgedit_" + id).css('visibility', '');
  }

  // Attaches the initEmbed function to the iframe when possible
  sketchily.attachLoadHandler = function (id, value, hide_menu, hide_image_tool, show_hyperlink_tool, url) {
    var frame = $("#svgedit_" + id);
    if (frame.attr('src')) {
      frame.load(function () {
        initEmbed(id, value,
                  hide_menu, hide_image_tool, show_hyperlink_tool,
                  url);
      });
    }
    else {
      setTimeout(function () {
        sketchily.attachLoadHandler(id, value,
                                    hide_menu, hide_image_tool,
                                    show_hyperlink_tool,
                                    url);
      }, 0);
    }
  }

}(window.sketchily = window.sketchily || {}, jQuery));

