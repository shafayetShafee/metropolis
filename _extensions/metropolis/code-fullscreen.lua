local function ensure_html_deps()
  quarto.doc.add_html_dependency({
    name = "jquery",
    version = "3.6.3",
    scripts = {
      { path = "asset/jquery-3.6.3.min.js"}
    }
  })
  quarto.doc.add_html_dependency({
    name = "code-fullscreen",
    version = "1.0.0",
    scripts = {
      { path = "resources/js/code-fullscreen.js", attribs = {defer = "true"} }
    },
    stylesheets = {"resources/css/code-fullscreen.css"}
  })
end


if quarto.doc.is_format('html:js') then
  ensure_html_deps()
end
