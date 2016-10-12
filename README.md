# reading.vim

Reading formatting for Vim.

## Overview

I occasionally like to read longer-form prose text files in Vim. This ftplugin displays prose in a reasonable manner, maps j/k to select paragraphs, and highlig
hts each paragraph with cursorline while hiding the cursor itself.

## Installation

I recommend installing with [pathogen](https://github.com/tpope/vim-pathogen).

## Usage

Run `:setf reading` in a buffer you want to read.

## Assumptions

The format assumed here is single-line paragraphs with a blank line separating each.

## Screenshot

![reading.vim screenshot](/readingdotvim.png?raw=true)
