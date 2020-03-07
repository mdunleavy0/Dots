#! /bin/sh

git config filter.pybase16.clean \
    "sed '/%%base16_template/,/%%base16_template_end/{//!d;}'"
