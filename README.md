# Metropolis theme for RevealJs Presentations

A Quarto custom format to use a revealjs theme inspired by Beamer Metropolis Theme.

![](metropolis_theme.gif)

[`View Live Demo`](https://shafayetshafee.github.io/metropolis/example_gif.html)

## Installing

```bash
quarto use template shafayetShafee/metropolis
```

This will install the extension and create an example qmd file that you can use as a starting place for your article.


## Install or update for an existing document

You may also use this format with an existing Quarto project or document. This will install only the files in the `_extension` folder and will not install the files above that (the demo files). This is also how to update the extension if there have been changes.

From the quarto project or document directory, run the following command:

```bash
quarto add shafayetShafee/metropolis
```

## Using

Simply use the format `metropolis-revealjs`,

```
---
format: metropolis-revealjs
---
```

## Header text and code-fullscreen button

This format comes along with the functionalities from the extensions [`reveal-header`](https://github.com/shafayetShafee/reveal-header) and [`code-fullscreen`](https://github.com/shafayetShafee/code-fullscreen).

`code-fullscreen` button is added to all code blocks by default. If you do not want this button, simply use the option `code-fullscreen: false` in the document yaml.

The options for `reveal-header` goes under the `reveal-header` key in the yaml.

| `reveal-header` Options   | Description                                                                                                                                                         |
|----------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `header-text`        | A simple header text to appear in the top part of the each slide. `header` can be overridden by `title-as-header` or `subtitle-as-header` or slide specific header. |
| `header-logo`        | A path for logo image which will appear on the top-left corner of each slide.                                                                                       |
| `sc-sb-title`        | `true` or `false`. Specifies whether level1 (`h1`) and level2 (`h2`) slide titles should appear in the slide header automatically when `slide-level` is 2 or 3.     |
| `tilte-as-header`    | `true` or `false`. Specifies whether the Slide title should appear as the slide header automatically. Will override the `header` text.                              |
| `subtitle-as-header` | `true` or `false`. Specifies whether the Slide subtitle should appear in the slide header automatically. Will ovverride the `title-as-header`.                      |

## Example

| Examples                                                                                            |                                         |                                                                                    |
|-----------------------------------------------------------------------------------------------------|-----------------------------------------|------------------------------------------------------------------------------------|
| The template file that comes with the format                                                        | [`source code`](template.qmd)           | [`live demo`](https://shafayetshafee.github.io/metropolis/template.html)           |
| A presentation with header logo and header text                                                     | [`source code`](example_header01.qmd)   | [`live demo`](https://shafayetshafee.github.io/metropolis/example_header01.html)   |
| A presentation with Section and subsection title on header (used with `slide-level: 3`)             | [`source code`](example_header03.qmd)   | [`live demo`](https://shafayetshafee.github.io/metropolis/example_header03.html)   |
| A presentation with header logo, Section and subsection title and subtitle as header text on header | [`source code`](example_header02.qmd)   | [`live demo`](https://shafayetshafee.github.io/metropolis/example_header02.html)   |
| A presentation with code blocks with many lines (to show the utility of code fullscreen button)     | [`source code`](example_fullscreen.qmd) | [`live demo`](https://shafayetshafee.github.io/metropolis/example_fullscreen.html) |