# Tuftesque2

## Install

```r
devtools::install_github('nstrayer/tuftesque2')
```

## Use

Replace the `output` value in your `.Rmd` header with `tuftesque2::tuftesque`... 

__Before:__

```yaml
...
author: "Nick Strayer"
date: "4/25/2019"
output: html_document
---
```

__After:__

```yaml
...
author: "Nick Strayer"
date: "4/25/2019"
output: tuftesque2::tuftesque
---
```

## Side-notes

__Text notes:__

To do a plain text sidenote just wrap whatever you want in square brackets `[...]` followed by curly brackets with `.side-note` inside...

```
Normal text [an insightful sidenote]{.side-note} and some more text...
```

<img width="735" alt="Screen Shot 2019-04-25 at 3 17 21 PM" src="https://user-images.githubusercontent.com/6764693/56765821-90cd9880-676d-11e9-8874-d31b1af4adcb.png">

__Arbitrary notes:__

If you want to put a plot or other more complicated values in your side-note you simply wrap everything in colon buffers: 

````
::::: {.side-note}

You can even do plots in the side notes! 

```{r, echo=FALSE}
library(magrittr)
library(ggplot2)
tibble::tibble( x = rnorm(200) ) %>% 
  ggplot(aes(x = x)) + 
  geom_histogram(bins = 100)
```
::::: 
````
<img width="745" alt="Screen Shot 2019-04-25 at 3 18 31 PM" src="https://user-images.githubusercontent.com/6764693/56765820-8f03d500-676d-11e9-838a-84286daa1b75.png">


## Warning

This is under active development, use at your own peril. 
