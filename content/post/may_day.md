+++
date = "2017-03-14T23:10:56-07:00"
title = "May Day 2017 Outreach"
author = "Christopher Kuttruff"
description = ""
categories = []
tags = ["May Day", "outreach", "printing", "programming"]

+++

Alright, things just got serious with Portland May Day Coalition outreach letters  :)

There are about 150 orgs this is going out to, and I'll be damned if I do any of the envelope / letter creation manually.  The irony is it has probly taken longer to automate than suffer through the manual tedium, but it'll be really useful (and save significant time) going forward.

#### For the typography / print nerds:

* letters: on a 65 lb, subtly patterned cardstock
* envelopes: off-white linen/cotton composite (with a finely raised cross-hatched pattern)
* font: Quattrocento (14 and 18pt for sender / recipient respectively)
* printer is an HP 477dw (sharp as hell)

![May Day Letter](/images/posts/may_day_letter.jpg)

Started off with labels, but it looks much better (and there's more space) when printing directly on the envelopes

#### For the coding nerds:

1. Created a google doc template for the envelopes / letter (beautifully written by a comrade in the coalition)
1. Wrote google scripts to iterate around all the relevant spreadsheet data (orgname, address, etc)
1. Generated new documents for each substituted version (ready for printing once downloaded)

[code here (github gist)](https://gist.github.com/ckuttruff/ae1bf94119e5901edcfc47ea0fed9253)

#### TODO:

Get more familiar with LaTeX, cause google doc operations are slow and there are formatting discrepancies with their docx and libreoffice odt :/ More on this later

\

----------------

\


![May Day Letter](/images/posts/may_day_template.jpg)

![May Day Letter](/images/posts/may_day_code.jpg)
