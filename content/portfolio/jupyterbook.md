+++
date = "2016-11-05T19:41:01+05:30"
title = "Jupyterbook"
draft = false
image = "img/olymvis-jb.png"
showonlyimage = false
weight = 9
+++

If you have `.ipynb` files 

[Demo](https://olymvis-jupyterbook.hongtaoh.com/) | [Source](https://github.com/hongtaoh/olymvis-jupyterbook) | [Theme](https://jupyterbook.org/) 

<!--more-->

## Project Structure

```
├── 01-abstract
├── 03-lit
│   ├── 01-lit-female.md
│   ├── 02-lit-homefield.md
│   ├── 03-lit-efficiency.md
│   ├── 04-lit-ranking.md
│   └── index.md
├── 04-plans
│   ├── 01-plans-female.md
│   ├── 02-plans-homefield.md
│   ├── 03-plans-efficiency.md
│   ├── 04-plans-ranking.md
│   └── index.md
├── 05-plots
│   ├── 01-plots-female.md
│   ├── 02-plots-female-continent.md
│   ├── 03-plots-homefield.md
│   ├── 04-plots-efficiency.md
│   ├── 05-plots-ranking.md
│   └── index.md
├── _build
│    ...
├── _config.yml
├── _toc.yml  -----> See ▼ below for details
├── abstract.md
├── conclusion.md
├── deploy.sh
├── intro.md
├── logo.png
├── motivation.md
├── olympics.png
├── ref.md
└── requirements.txt
```


## `_toc.yml`:


- file: intro
- file: abstract
- file: motivation
- file: 03-lit/index
  sections:
    - file: 03-lit/01-lit-female
    - file: 03-lit/02-lit-homefield
    - file: 03-lit/03-lit-efficiency
    - file: 03-lit/04-lit-ranking
- file: 04-plans/index
  sections:
    - file: 04-plans/01-plans-female
    - file: 04-plans/02-plans-homefield
    - file: 04-plans/03-plans-efficiency
    - file: 04-plans/04-plans-ranking
- file: 05-plots/index
  sections:
    - file: 05-plots/01-plots-female
    - file: 05-plots/02-plots-female-continent
    - file: 05-plots/03-plots-homefield
    - file: 05-plots/04-plots-efficiency
    - file: 05-plots/05-plots-ranking
- file: conclusion
- file: ref
