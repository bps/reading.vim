# reading.vim

Reading formatting for Vim.

![reading.vim screenshot](/readingdotvim.png?raw=true)

## Overview

I occasionally like to read longer-form prose text files in Vim. This ftplugin:

- Displays prose in a reasonable manner.
- Maps j/k to select paragraphs.
- Maps space bar to scroll such that a full screen of unread text is displayed.
- Highlights each paragraph with cursorline while hiding the cursor itself.

## Installation

I recommend installing with [pathogen](https://github.com/tpope/vim-pathogen).

## Usage

Run `:setf reading` in a buffer you want to read.

## Assumptions

The format assumed is single-line paragraphs with a blank line separating each paragraph.
