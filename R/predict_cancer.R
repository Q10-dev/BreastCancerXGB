#' Predict breast cancer diagnosis using an XGBoost model
#'
#' @param newdata A data.frame containing the required feature columns
#' @return A factor vector of predicted diagnosis labels ("B" or "M")
#' @examples
#' data(example_data)
#' predict_cancer(example_data)
#' @export
predict_cancer <- function(newdata) {

  # -----------------------------
  # Load xgboost model
  # -----------------------------
  model_path <- system.file("models", "xgb_model.bin", package = "BreastCancerXGB")
  meta_path  <- system.file("models", "model_metadata.rds", package = "BreastCancerXGB")

  if (model_path == "" || meta_path == "") stop("Model files not found. Please reinstall the package.")

  model <- xgboost::xgb.load(model_path)
  meta  <- readRDS(meta_path)

  # -----------------------------
  # Input checking
  # -----------------------------
  if (!is.data.frame(newdata)) stop("newdata must be a data.frame")

  # check missing features
  required_features <- meta$feature_names
  missing_features <- setdiff(required_features, names(newdata))
  if (length(missing_features) > 0) stop(paste("Missing features:", paste(missing_features, collapse = ", ")))

  # reorder columns
  newdata <- newdata[, required_features, drop = FALSE]

  # -----------------------------
  # Prediction
  # -----------------------------
  dmatrix <- xgboost::xgb.DMatrix(as.matrix(newdata))
  prob <- predict(model, dmatrix)

  # convert to factor labels
  preds <- factor(ifelse(prob > 0.5, "M", "B"), levels = c("B","M"))

  return(preds)
}
