---
title: "BreastCancerXGB"
output: rmarkdown::html_document
---


Predict breast cancer diagnosis using a pre-trained XGBoost model.

## Installation

```r
install.packages("remotes")

# install from GitHub
remotes::install_github("your_GitHub_username/BreastCancerXGB")
```

## Quick Start

```r
library(BreastCancerXGB)

# Load example data
data(example_data)

# Make predictions
predict_cancer(example_data)
```


## Model Info

Model type: XGBoost classification

Labels: "B" = Benign, "M" = Malignant

Features: See model_metadata.rds


## Required Features

The model expects 30 features from the Wisconsin Breast Cancer Dataset:

radius_mean, texture_mean, perimeter_mean, area_mean, smoothness_mean, compactness_mean, concavity_mean, concave.points_mean, symmetry_mean, fractal_dimension_mean

radius_se, texture_se, perimeter_se, area_se, smoothness_se, compactness_se, concavity_se, concave.points_se, symmetry_se, fractal_dimension_se

radius_worst, texture_worst, perimeter_worst, area_worst, smoothness_worst, compactness_worst, concavity_worst, concave.points_worst, symmetry_worst, fractal_dimension_worst


## Error Handling

The function checks for:

Missing required features

Incorrect data types

Model file availability


## More Information

See the package documentation for details.
