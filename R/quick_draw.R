# Easily perform initial Visualization with statistical basis and logic

# Automatically parse data, fill missing.

quick_draw <- function(df) {
    df <- df
    columns <- names(df)

    for (col in columns) {
        if (class(df[[col]]) == "numeric") {
        } else if (class(df[[col]]) == "integer") {
        } else if (class(df[[col]]) == "character") {
        } else if (class(df[[col]]) == "logical") {
        } else {
            print("Data types not supported.")
            return()
        }
    }
}
