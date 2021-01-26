+++
date = "2016-11-05T21:05:33+05:30"
title = "Tutorial: How to create online books"
+++

In the following, I'll talk about how to make online books or online documentation using four different tools/frameworks: [Hugo](https://gohugo.io/), [VuePress](https://vuepress.vuejs.org/), [Jupyterbook](https://jupyterbook.org/intro.html), and the R pacakage of [Bookdown](https://github.com/rstudio/bookdown). For each tool, I'll detail (1) installation, (2) usage, (3) content structure, (4) customization, and (5) publishing.

## Why online books

- Open access: empower people and extend the influence of your work

- Open source: enable others to contribute!

- A better way to learn: creating an online book helps you organize your knowledge and learn at a deeper level.

## Hugo

[Hugo](https://gohugo.io/) defines itself as "the world's fastest framework for building websites". It is essentially a static site generator written in [Go](https://golang.org/). It is becoming increasingly popular partly because of its speed of rendering website pages. 

Some useful links:

- [Official website](https://gohugo.io/)

- [GitHub Repo](https://github.com/gohugoio/hugo)

- [Forum](https://discourse.gohugo.io/)

- [Official documentation](https://gohugo.io/documentation/)

### Install Hugo

Whether your computer is running or macOS, Windows, or Linus, you can download the binary from the [Hugo releases](https://github.com/gohugoio/hugo/releases). [Here](https://github.com/gohugoio/hugo/releases) is the official instruction. You can read [my post](https://hongtaoh.com/en/2020/01/29/how-to-install-and-upgrade-hugo-on-mac/) on installing and upgrading Hugo on Mac as well. 

If you are are Mac user and using Homebrew, you can install with:

```bash
brew install hugo
```

If you experience difficulties installing Hugo, please refer to the [official guide](https://gohugo.io/getting-started/installing/) on installation. 

### Use Hugo

#### 1. Generating a demo site

After intalling Hugo, please open your terminal and test whether the installation is successful with `hugo version`. 

Now, we are going to generate a demo site. In your terminal, first change directory to where you want the demo site to sit. 

Then, simply use

```bash
hugo new site demosite # You can change "demosite" to any other names you like. 
```

You'll see a new folder named "demosite" generated.

#### 2. Download Themes

To build a website with Hugo, you need to use a theme. It can be developed by others or yourself. You can find available themes [here](https://themes.gohugo.io/). Considering the purpose of this tutorial, I'll focus on [Hugo themes suitable for making documentations](https://themes.gohugo.io/tags/documentation/).

Specifically, I chose five themes for books:

- [Hugo Book](https://github.com/alex-shpak/hugo-book)

- [Compose](https://github.com/onweru/compose)

- OpenGitDocs (not listed among the official themes)

- [Hugo Learn](https://github.com/matcornic/hugo-theme-learn/)

- [Hugo Techdoc](https://github.com/thingsym/hugo-theme-techdoc)

One theme for long articles:

- [Hugo Prose](https://github.com/yihui/hugo-prose)

If you don't care about the look of a book or an article, you can apply any themes you like. For example, [this](https://olymviz.hongtaoh.com/) is the demo site when I used the [XMin](https://github.com/yihui/hugo-xmin) theme.

To use a theme, you need to:

```bash
cd demosite/themes
git submodule add ThemeRepoRUL # e.g., git submodule add https://github.com/alex-shpak/hugo-book
``` 

Using `git submodule` comes with the caveat that if you customize the theme, your customization might break if the original theme updates considerably. 

To avoid this issue, I recommend using

```bash
cd demosite/themes
git clone ThemeRepoURL # e.g., git clone https://github.com/alex-shpak/hugo-book
cd RepoNmae # e.g., cd hugo-book
# git remote -v
git remote rm origin
cd .. # go back to themes
cd .. # go back to demosite
```

`git remote rm origin` is necessary because if you don't run it, you'll probably see the below error message (I am taking hugo-creative-portfolio-theme as an example):

```bash
warning: adding embedded git repository: themes/hugo-creative-portfolio-theme
hint: You've added another git repository inside your current repository.
hint: Clones of the outer repository will not contain the contents of
hint: the embedded repository and will not know how to obtain it.
hint: If you meant to add a submodule, use:
hint: 
hint: 	git submodule add <url> themes/hugo-creative-portfolio-theme
hint: 
hint: If you added this path by mistake, you can remove it from the
hint: index with:
hint: 
hint: 	git rm --cached themes/hugo-creative-portfolio-theme
hint: 
hint: See "git help submodule" for more information.
```

As commented, before running `git remote rm origin`, you can use `git remote -v` to check whether you should use `rm origin`. 

For example, after running `git remote -v`, I saw

```bash 
origin	https://github.com/kishaningithub/hugo-creative-portfolio-theme (fetch)
origin	https://github.com/kishaningithub/hugo-creative-portfolio-theme (push)
```

Obviously, I should use `git remote rm origin`. 

#### 3. See the exampleSite

Most themes come with an `exampleSite` which usually contains `content`, `static` and `config.toml`. Please copy all the stuff in this `exampleSite` and paste theme to the root directory of `demosite`. If files already have some of the names, for example, `config.toml`, just replace it with the new one (the one from `exampleSite`).

**CAUTION**: This will eradicate all material within the `content` folder at the root directory of `demosite`. If you have important files in this `content` folder, please make copies before move stuff in `exampleSite`!

Another thing you need to take notice is that in `config.toml`, make sure that the theme name, which you'll find in `theme = "ThemeNmae"`, should be exactly the same as the folder name of the repo name you just `git clone`d or `git submodule`d. 

Also note that you can put as many themes within the `themes` folder as you like. Every time you want to change a theme, simply change the theme name in `config.toml`'s `theme = "ThemeNmae"` However, you might need to copy and paste the `exampleSite` of each theme every time. Be mindful of the **caution** I mentioned above. 

To see the example site, at the root directory of `demosite`:

```bash
hugo server -D
```

If everything goes well, open `http://localhost:1313/` and you'll see the example site that you saw in the theme's repo. 

To stop the local server, press `Ctrl` + `C`. 

### Create your own content

After establishing the theme you want to use, you need to create your own content. 

For books or documentation, the structure is central. To get the order of chapters and sections you desired, you need to specify `weight` for each `markdown` file. 

Let's say your book has this structure:

```
├── _index.md
├── chapter01
│   ├── _index.md
│   ├── section01.md
│   └── section02.md
├── chapter02
│   ├── _index.md
│   ├── section01.md
│   ├── section02.md
│   └── section03.md
└── chapter03
    └── _index.md
```

Since the number of sections seldom exceeds ten, the weight of each `markdown` file can be set as the following:

```
├── _index.md  # ---> weight: 1 
├── chapter01  
│   ├── _index.md  # ---> weight: 10
│   ├── section01.md  # ---> weight: 11
│   └── section02.md  # ---> weight: 12
├── chapter02
│   ├── _index.md  # ---> weight: 20
│   ├── section01.md  # ---> weight: 21
│   ├── section02.md  # ---> weight: 22
│   └── section03.md  # ---> weight: 23
└── chapter03
    └── _index.md  # ---> weight: 30
```

You get the idea, right?

### Customize

Customization of Hugo themes can be super easy or challenging, depending on how much you want to change. 

To customize, you need a deeper understanding of HTML, CSS, and of course, [Hugo](https://gohugo.io/documentation/), which is beyond the scope of this online book tutorial. That said, I'd like to point out some basic cusomization tips:

- To customize the general look of the book's pages, you'll need to make changes within `themes/YourTheme/layouts`. You can find most defaul styling in `_default` and `partials`. 

- To customize the look a page more deeply, you'll need to go to `themes/YourTheme/static/css`. Some themes put the styling in lots of `.scss` files within the `assets` folder. 

If you want to customize the theme more deeply, I highly recommend you to read the book of [*Blogdown*](https://bookdown.org/yihui/blogdown/) by [Yihui Xie](https://bookdown.org/yihui/blogdown/yihui-xie.html).

### Publish a Hugo site

You can find [a complete list](https://gohugo.io/hosting-and-deployment/) of ways to host a Hugo site on the official hugo site. I'll only talk how to publish via [Netlify](https://www.netlify.com/), which is free. 

First of all, you need to create a GitHub repository for your book project and let's say you name it as `book_project`. 

Then, at the root directory of `demosite`, create a file named `netlify.toml` with the following content:

```toml
[build]
publish = "public"
command = "hugo --gc --minify"

[context.production.environment]
HUGO_VERSION = "0.80.0"
HUGO_ENV = "production"
HUGO_ENABLEGITINFO = "true"

[context.split1]
command = "hugo --gc --minify --enableGitInfo"

[context.split1.environment]
HUGO_VERSION = "0.80.0"
HUGO_ENV = "production"

[context.deploy-preview]
command = "hugo --gc --minify --buildFuture -b $DEPLOY_PRIME_URL"

[context.deploy-preview.environment]
HUGO_VERSION = "0.80.0"

[context.branch-deploy]
command = "hugo --gc --minify -b $DEPLOY_PRIME_URL"

[context.branch-deploy.environment]
HUGO_VERSION = "0.80.0"

[context.next.environment]
HUGO_ENABLEGITINFO = "true"
```

The above came from [Hugo's official instructions](https://gohugo.io/hosting-and-deployment/hosting-on-netlify/#configure-hugo-version-in-netlify). Be sure to customize `0.80.0` if your Hugo version is different. 

Then, open your Terminal:

```bash
cd demosite
git init 
rm -rf public
hugo
git add .
git commit -m "my first commit."
git remote add origin https://github.com/UserName/book_project #Please replace UserNmae with your github username
git push -u origin master
```

Refresh the repo page `book_project`. After making sure that all the stuff in `demosite` is uploaded, open [https://www.netlify.com/](https://www.netlify.com/).

What you should do later can be found in Hugo's guide of [Host on Netlify](https://gohugo.io/hosting-and-deployment/hosting-on-netlify/):

- [Create a Netlify account](https://gohugo.io/hosting-and-deployment/hosting-on-netlify/#create-a-netlify-account)

- [Create a New Site](https://gohugo.io/hosting-and-deployment/hosting-on-netlify/#create-a-new-site-with-continuous-deployment)

- [Build and Deploy](https://gohugo.io/hosting-and-deployment/hosting-on-netlify/#build-and-deploy-site)


## VuePress

### Install and Use

[VuePress](https://vuepress.vuejs.org/) is a static site generator powered by [Vue.js](https://vuejs.org/).

To be able to use VuePress, you need to make sure you've had [Node.js](https://nodejs.org/en/) installed. 

The [official guide](https://vuepress.vuejs.org/guide/getting-started.html) had detailed instrcutions. I'll summarize in the following. 

Open your terminal, change the directory to where you want the new project sit, and then

```bash
mkdir vuepress-starter 
cd vuepress-starter
npm init
npm install -D vuepress 
mkdir docs  # All of the future content will be put in the folder of docs
echo '# Hello VuePress' > docs/README.md
mkdir .vuepress
```

If you are on macOS and cannot see the hidden folder of `.vuepress` just created, press `CMD` + `Shift` + `.` simultaneously. 

### Content structure

Please take a look at the sample site I created using VuePress at [https://vuepress-starter.hongtaoh.com/](https://vuepress-starter.hongtaoh.com/), whose GitHub Repo is at [https://github.com/hongtaoh/vuepress-starter](https://github.com/hongtaoh/vuepress-starter).

The structure of the book content is as follows:

```
├── 01-abstract
│   └── README.md
├── 02-motivation
│   └── README.md
├── 03-lit
│   ├── 01-lit-female.md
│   ├── 02-homefield.md
│   ├── 03-efficiency.md
│   ├── 04-ranking.md
│   └── README.md
├── 04-plans
│   ├── 01-plan-female.md
│   ├── 02-plan-homefield.md
│   ├── 03-plan-efficiency.md
│   ├── 04-plan-ranking.md
│   └── README.md
├── 05-plots
│   ├── 01-plots-female.md
│   ├── 02-plots-female-continent.md
│   ├── 03-plots-homefield.md
│   ├── 04-plots-efficiency.md
│   ├── 05-plots-ranking.md
│   └── README.md
├── 06-conclusion
│   └── README.md
├── 07-reference
│   └── README.md
└── README.md
```

The easiest way to make sure the order of chapters and sections is what you desired is to use numbers like I did. 

To customize the sidebar and/or the navbar, first, you need to create a file named `config.js` within the `docs/.vuepress` folder:

```bash
> config.js
```

The Navbar is relatively easy to set, read the instrctions [here](https://vuepress.vuejs.org/theme/default-theme-config.html#navbar) or look at the [config.js](https://github.com/hongtaoh/vuepress-starter/blob/master/docs/.vuepress/config.js) of the example site. 

The Sidebar is a little bit complicated. I chose to use [vuepress-plugin-sidebar](https://github.com/tacck/vuepress-plugin-sidebar) to generate the sidebar-manu automatically. Again, look at the [config.js](https://github.com/hongtaoh/vuepress-starter/blob/master/docs/.vuepress/config.js) of the example site, or [VuePress's instructions](https://vuepress.vuejs.org/theme/default-theme-config.html#sidebar).

Before serving the site, you are encouraged to add the following to `package.json`:

```js
{
  "scripts": {
    "docs:dev": "vuepress dev docs",
    "docs:build": "vuepress build docs"
  }
}

```

To serve the site locally, at the root directory of `vuepress-starter`:

```bash
npm run docs:dev
```

Make relavent changes until you are satisfied with the look and structure. 

### Customization

Please refer to the [Theme section](https://vuepress.vuejs.org/theme/) of VuePress's official documentation for more information. If you don't like the default look, you change the theme or write your own theme. 

### Publish

First, as usual, you need to create a repository on GitHub (or similar platforms). 

In case you are not familar with Git, at the root directory of `vuepress-starter` you just created:

```bash
git init
git add .
git commit -m "my first commit"
git remote add origin https://github.com/UserName/ProjectName
git push -u origin master
``` 

You can find the [official instructions](https://vuepress.vuejs.org/guide/deploy.html) on publishing a VuePress project. Again, I recommond the Netlify option. 

## Jupyterbook

Jupyterbook is great if you have Jupyter Notebook (`.ipynb`) files. Even if you have pure texts, the functions of Jupyterbook might interest you. 

### Install

If you don't have Python yet, you need to first install it. 

You can install Jupyterbook via pip:

```bash
pip install -U jupyter-book
```

### Get started

You can create a sample book:

```bash
jupyter-book create samplebook/
```

Or you can `git clone` the [demo site](https://olymvis-jupyterbook.hongtaoh.com/) I created:

```bash
git clone https://github.com/hongtaoh/olymvis-jupyterbook
```

### Content structure

Simply put all your content in the root directory of your book project. Take [my demo site](https://olymvis-jupyterbook.hongtaoh.com/) as an example:

```
├── 01-abstract
├── 03-lit
│   ├── 01-lit-female.md
│   ├── 02-lit-homefield.md
│   ├── 03-lit-efficiency.md
│   ├── 04-lit-ranking.md
│   └── index.md
├── 04-plans
│   ├── 01-plans-female.md
│   ├── 02-plans-homefield.md
│   ├── 03-plans-efficiency.md
│   ├── 04-plans-ranking.md
│   └── index.md
├── 05-plots
│   ├── 01-plots-female.md
│   ├── 02-plots-female-continent.md
│   ├── 03-plots-homefield.md
│   ├── 04-plots-efficiency.md
│   ├── 05-plots-ranking.md
│   └── index.md
├── _build
│    ... (lots of files after you serve the site locally)
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

Then, configure the structure in `_toc.yml`:

```
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
```

### Serve the site locally

To build the book, first change directory to the **directory one level higher than your book project** (e.g., `book_project`). For example, if the book project is sitting on your Desktop, then

```bash
cd Desktop
jupyter-book build book_project/ # Or: jb build book_project/
```

Open `file://Users/my_path_to_book/_build/index.html` and you'll be able to see the site. See the output after you run `jupyter-book build book_project/` for the exact address of `file://...`.

### Customization

For details on customization, and all the features enabled by MyST Markdown, please consult the [official documentaion](https://jupyterbook.org/intro.html) of Jupyterbook.

### Publish

You can publish your jupyterbook project with [GitHub Pages and Actions](https://jupyterbook.org/publish/gh-pages.html). For consistency and simplicity, I'll talk about how publish via Netlify. 

Again, you need to create a repository for your project. In case you are not familar with Git, at the root directory of `book_project`:

```bash
git init
git add .
git commit -m "my first commit"
git remote add origin https://github.com/UserName/ProjectName
git push -u origin master
``` 

To configure Netlify, refer to the relevant section in the Hugo tutorial above. In the last step of "Deploy site" on Netlify, I suggest that you leave "Build command" blank and input `_build/html` for "Pubish directory".

I tried the configuration mentioned in the section of [Publish with Netlify](https://jupyterbook.org/publish/netlify.html) on the official documentation. The [Step 2](https://jupyterbook.org/publish/netlify.html) did not work for me. Therefore, I chose to leave "Build command" blank on Netlify. This means that you'll have to build the site (with `jupyter-book build book_project/` mentioned above) before updating your content. 

## R Bookdown

I personally recommend [Bookdown](https://github.com/rstudio/bookdown) because

1. Simple but elegent look
2. Easy to generate decent PDF and MS Word files

### Install Bookdown

First, make sure you already have R and [Rstudio IDE](https://www.rstudio.com/products/rstudio/download/) installed. 

In R, to install the package of Bookdown:

```r
install.packages("bookdown")
```

### Get started

If you want an almost empty demo project, refer to the [Get started section](https://bookdown.org/yihui/bookdown/get-started.html) of the [Bookdown official documentation](https://bookdown.org/yihui/bookdown/).

Or you can `git clone` the Repo of [my example site](https://olymvis-bookdown.hongtaoh.com/):

```bash
git clone https://github.com/hongtaoh/olymvis-bookdown
```

I am familiar with my example, so I'll use it for illustration. 

### Use

In my example, if you only want the book in `HTML` format, not in PDF or MS Word, then in `_output.yml` please comment out these lines:

```yml
bookdown::pdf_book:
  includes:
      in_header: preamble.tex
  latex_engine: xelatex
  citation_package: natbib
  keep_tex: yes
bookdown::epub_book:
  stylesheet: css/style.css
```

In `index.Rmd`, comment out:

```Rmd
output: 
   bookdown::word_document2:
     toc: true
```

If you wist to generate PDF, you need to install a LaTeX distribution. Yihui recommends installing [TinyTex](https://yihui.org/tinytex/) if you don't have one distribution installed already.

### Content structure

Each chapter should be a stand-alone `.Rmd` file. You need to start the `.Rmd` file with a chapter name using `# Chapter Name`. If you don't want a certain chapter to be numbered, use `# Chapter Name {-}`. To make the url of each chapter look decent, you can tag it as `# Chapter Name {#WhateverTagYouLike}`.

Each chapter can have sections and subsections, which are set with second/third/fourth/fifth/sixth-level headings. Sections and Subsections can also be tagged. 

Read [here](https://bookdown.org/yihui/bookdown/usage.html) for details. 





