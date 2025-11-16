#Funnel Chart
#https://plotly.com/r/funnel-charts/

library(plotly)

#basic----

fig <- plot_ly(  type = "funnelarea",
  text = c("The 1st","The 2nd", "The 3rd", "The 4th", "The 5th"),
  values = c(5, 4, 3, 2, 1))
fig

#type1---
fig <- plot_ly()
fig <- fig %>% add_trace(type ='funnel', y=c('Leads', 'Inquiries', 'Forms','Selection', 'FeePaid', 'Enrolment'), x=c(100, 80, 60, 40, 20,10), marker = list(color = c('red','pink','brown', 'violet','orange','yellow'), line = list(width=1, color='red')))
fig <- fig %>% layout(yaxis = list(categoryarray= c('Leads', 'Inquiries', 'Forms','Selection', 'FeePaid', 'Enrolment')))
fig                         
