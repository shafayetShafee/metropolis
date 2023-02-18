--[[
MIT License

Copyright (c) 2023 Shafayet Khan Shafee

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
]]--


-- dependencies for code fullscreen
local function ensure_codefullscreen_deps()
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

-- dependencies for reveal-header
local function ensure_reveal_header_deps()
  quarto.doc.add_html_dependency({
    name = "reveal-header",
    version = "1.0.0",
    scripts = {
      { path = "resources/js/add_header.js", attribs = {defer = "true"}}
    },
    stylesheets = {"resources/css/add_header.css"}
  })
  end
  
  local function sc_sb_title()
    quarto.doc.add_html_dependency({
    name = "sc-sb-title",
    version = "1.0.0",
    scripts = {
      { path = "resources/js/sc_sb_title.js", attribs = {defer = "true"}}
    },
    stylesheets = {"resources/css/sc_sb_title.css"}
  })
end


if quarto.doc.is_format('revealjs') then
  function Pandoc(doc)
    local blocks = doc.blocks
    local str = pandoc.utils.stringify
    local meta = doc.meta
    local reveal_header = meta['reveal-header']
    code_fullscreen = (meta['code-fullscreen'] == nil and true) or false
    
    if code_fullscreen then 
      -- Ensuring the code fullscreen dependencies
      ensure_codefullscreen_deps()
    end
    
    if reveal_header then
      ensure_reveal_header_deps()
      -- make divs structure for holding text and logo.
      if reveal_header['sc-sb-title'] then
        sc_sb_title()
      end
      local header_text = reveal_header['header-text'] and str(reveal_header['header-text']) or " "
      local header_para_class = {class = "header-text"}
      if reveal_header['title-as-header'] then
        header_text = meta['title']
        header_para_class = {class = "header-text title-text"}
      end
      if reveal_header['subtitle-as-header'] then
        header_text = meta['subtitle']
        header_para_class = {class = "header-text title-text"}
      end
      -- make divs structure for holding text and logo.
      local header_logo = reveal_header['header-logo'] and str(reveal_header['header-logo']) or ""
      local header_img = pandoc.Div(pandoc.Image("", header_logo, ""), {class = "header-logo"})
      local header_section = pandoc.Div(pandoc.Para(" "), {class = "sc-title"})
      local header_sbsection = pandoc.Div(pandoc.Para(" "), {class = "sb-title"})
      local header_para = pandoc.Div(pandoc.Para(header_text), header_para_class)
      local div = pandoc.Div(
        {
          header_img,
          header_section,
          header_para,
          header_sbsection
        }, 
        {class = 'reveal-header'})
      table.insert(blocks, div)
      return doc
    end
    
  end
end