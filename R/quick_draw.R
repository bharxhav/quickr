# Easily perform initial Visualization with statistical basis and logic

# Automatically parse data, fill missing.

quick_draw <- function(df, factoring_threshold = 0.1, parsing_threshold = 5) {
    df <- df
    columns <- names(df)

    for (col in columns) {
        row_count <- length(df[[col]])
        row_unique_count <- length(unique(df[[col]]))

        if (class(df[[col]]) == "numeric") {
            # Do Nothing... for now
        } else if (class(df[[col]]) == "integer") {
            # Factoring by threshold
            if (row_unique_count / row_count < factoring_threshold) {
                df[[col]] <- factor(df[[col]])
            }
        } else if (class(df[[col]]) == "character") {
            # Check for disguised nums
            non_numeric_count <- sum(!grepl("^\\d+\\.?\\d*$", df[[col]]))
            # Check for invalid characters, make them null
            if (non_numeric_count / row_count < threshold) {
                parsed_column <- suppressWarnings(
                    ifelse(grepl("^\\d+\\.?\\d*$", column_data), as.numeric(column_data), NA)
                )
            }
        } else if (class(df[[col]]) == "logical") {
            df[[col]] <- factor(df[[col]])
        } else {
            print("Data types not supported.")
            return()
        }
    }
}
