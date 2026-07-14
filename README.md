# split_mkdocs_tabs

Convert a MkDocs file to one Markdown file per language tab.


## The problem it fixes

You want to maintain an MkDocs website for multiple languages
and keep the multiple languages in the same file.
You use tabs with flag emojis to indicate which languages
the reader can choose.

![The rendered master document](man/figures/both.png)

> The rendered master document with one tabs for different languages

This R package allows one to split such a page
into the different one-per-language Markdown files.

English                       |Swedish
------------------------------|------------------
![English](man/figures/en.png)|![Swedish](man/figures/sv.png)

> The generated documents, one per language

## Usage

As an input file,
we use [`inst/extdata/example_1.md`](inst/extdata/example_1.md).
This files has tabs for two languages, English and Swedish.
These languages are indicited by an emoji of the flag of their language.
To create one file per language, do:

```r
splimata::split_tabs(
  input_file_name = "inst/extdata/example_1.md",
  output_file_prefix = "inst/extdata/example_1"
)
```

This will create two files:

- [`inst/extdata/example_1_en.md`](inst/extdata/example_1_en.md)
- [`inst/extdata/example_1_sv.md`](inst/extdata/example_1_sv.md)

