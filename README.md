# Visualize Gradient Table

---

This package creates a 3D visualization of dMRI gradient tables (using bvals and bvecs)

## Install

---

```{r}
devtools::install_github('epongpipat/visualizeGradientTable')
```

## Usage

---

```{r}
library(visualizeGradientTable)
visualize_gradient_table(in_bvals, in_bvecs, out_path)
```

<object type="text/html" data="/Volumes/shared/software/scripts/eep170030/GitHub/visualizeGradientTable/example.html" width="100%" height="400px"></object>

## Command-line

---

The function can also be used on the command line

### Install

```{r}
visualizeGradientTable::install_cmdline()
```

### Usage

```{bash}
visualize_gradient_table --in_bvals ${path2bvals} --in_bvecs ${path2bvecs} --out_path ${path2html}
```

## Dependencies

---

- dplyr
- tidyr
- plotly
- htmlwidgets
- stringr
