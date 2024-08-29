Dion <- data.frame(Player = rep("Dion Charles", 8),
                        Statistic = c("Goals","Goals per 90", "Assists per 90","Successful defensive actions per 90",
                                      "Duels per 90","Successful attacking actions per 90", 
                                      "Shots on target, %", "Goal conversion, %"),
                   Number = c(95, 89, 62, 68, 25, 87, 33, 78))

DC_fig <- fig <- plot_ly(
  type = 'scatterpolar',
  fill = 'toself'
) %>%
  add_trace(
    r = Dion$Number,
    theta = Dion$Statistic,
    name = 'Dion Charles',
    type = 'scatterpolar',
    fill = 'toself',
    fillcolor = 'rgba(0, 0, 250, .5)',
    marker = list(color = 'black')
  ) %>% 
  layout(
    polar = list(
      radialaxis = list(
        range = c(0, 100)
      )
    )
  )
htmlwidgets::saveWidget(widget = DC_fig, file = "DC.html")
webshot(url = "DC.html", file = "DC.png", delay = 1, zoom = 4, vheight = 500)

df_omit <- subset(df, select = -c(`Contract expires`))
df_omit <- na.omit(df_omit)


ecdf_goals <- ecdf(df_omit$`Goal conversion, %`)
value = 36
percentile <- ecdf_goals(value) * 100


Yengi <- data.frame(Player = rep("Kusini Yengi", 8),
                   Statistic = c("Goals","Goals per 90", "Assists per 90","Successful defensive actions per 90",
                                 "Duels per 90","Successful attacking actions per 90", 
                                 "Shots on target, %", "Goal conversion, %"),
                   Number = c(85, 99, 0, 62, 77, 89, 92, 97))

KY_fig <- fig <- plot_ly(
  type = 'scatterpolar',
  fill = 'toself'
) %>%
  add_trace(
    r = Yengi$Number,
    theta = Yengi$Statistic,
    name = 'Kusini Yengi',
    type = 'scatterpolar',
    fill = 'toself',
    fillcolor = 'rgba(0, 0, 230, .5)',
    marker = list(color = 'black')
  ) %>% 
  layout(
    polar = list(
      radialaxis = list(
        range = c(0, 100)
      )
    )
  )
htmlwidgets::saveWidget(widget = KY_fig, file = "KY.html")
webshot(url = "KY.html", file = "KY.png", delay = 1, zoom = 4, vheight = 500)


