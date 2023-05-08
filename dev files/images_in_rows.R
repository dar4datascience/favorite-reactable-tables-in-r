library(htmltools)
library(reactable)

data <- data.frame(
  Animal = c("beaver", "cow", "wolf", "cat"),
  Body = c(1.35, 465, 36.33, 27.66),
  Brain = c(8.1, 423, 119.5, 115)
)

reactable(
  data,
  columns = list(
    Animal = colDef(cell = function(value) {
      img_src <- knitr::image_uri(sprintf("images/%s.png", value))
      image <- img(src = img_src, style = "height: 24px;", alt = value)
      tagList(
        div(style = "display: inline-block; width: 45px", image),
        value
    )
      }),
    Body = colDef(name = "Body (kg)"),
    Brain = colDef(name = "Brain (g)")
  )
)