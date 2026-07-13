# split_mkdocs_tabs

Convert a MkDocs file to one Markdown file per tab

## Usage

As an input file,
we use [`inst/extdata/example_1.md`](inst/extdata/example_1.md).
This files has tabs for two languages, English and Swedish.
These languages are indicited by an emoji of the flag of their language.
To create one file per language, do:

```r
split_tabs(
  input_file_name = "inst/extdata/example_1.md",
  output_file_prefix = "example_1"
)
```

This will create two files:

- [`inst/extdata/example_1_en.md`](inst/extdata/example_1_en.md)
- [`inst/extdata/example_1_sv.md`](inst/extdata/example_1_sv.md)

