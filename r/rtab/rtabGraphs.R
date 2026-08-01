# Tableau Graphs in R
#lib-----
pacman::p_load(dplyr, tidyverse, scales, lubridate)
theme_set(theme_minimal(base_size = 12))
options(  width = 80)
#data-----
gitData ='https://raw.githubusercontent.com/dupadhyaya/piit/refs/heads/main/data/superstore_orders.csv'

orders = read.csv(gitData)
dim(orders)
names(orders)
head(orders)

#clean----
orders1 <- orders %>%  mutate(Order.Date = dmy(Order.Date))
range(orders1$Order.Date)

#HorzBar-----
category_sales <- orders %>%  group_by(Category) %>%  summarise( Sales = sum(Sales, na.rm = TRUE),    .groups = "drop"   )
category_sales
bar_chart <- ggplot(  category_sales,  aes(    x = reorder(Category, Sales),    y = Sales,    fill = Category )) +  geom_col(    show.legend = FALSE  ) +  coord_flip() +  geom_text(    aes(  label = dollar(Sales) ),    hjust = -0.1  ) +  scale_y_continuous(    labels = label_dollar(),    expand = expansion(      mult = c(0, 0.18)    )  ) +  labs(    title = "Total Sales by Category",    subtitle = "Superstore Orders",    x = "Category",    y = "Total Sales"  )

bar_chart

#StackedBar-----
region_category_sales <- orders %>%   group_by(  Region,  Category) %>%  summarise(    Sales = sum(  Sales,      na.rm = TRUE    ),    .groups = "drop"  )
stacked_bar <- ggplot(   region_category_sales,  aes(    x = Region,    y = Sales,    fill = Category  )) +  geom_col() + geom_text(aes(label=round(Sales)), position = position_stack(.8)) +  scale_y_continuous(    labels = label_dollar()  ) +  labs(    title = "Sales by Region and Category",    subtitle = "Categories are stacked within each region",    x = "Region",    y = "Total Sales",    fill = "Category"  ) +  theme(    legend.position = "bottom"  )
stacked_bar + geom_text(aes(label=round(Sales)), position = position_stack(.8))
side_by_side_bar <-  ggplot(   region_category_sales,  aes(    x = Region,    y = Sales,    fill = Category  )) +  geom_col(position = 'dodge') + geom_text(aes(label=round(Sales)), position = position_dodge2(.8), angle=90) +  scale_y_continuous(    labels = label_dollar()  ) +  labs(    title = "Sales by Region and Category",    subtitle = "Categories are stacked within each region",    x = "Region",    y = "Total Sales",    fill = "Category"  ) +  theme(    legend.position = "bottom"  )
side_by_side_bar

#Line------
monthly_sales <- orders1 %>%  mutate(    Month = floor_date( Order.Date,      unit = "month"    )
  ) %>%  group_by(Month) %>%  summarise(    Sales = sum(      Sales,      na.rm = TRUE    ),    .groups = "drop"  )

line_chart <- ggplot(  monthly_sales,  aes(    x = Month,    y = Sales  )) +  geom_line(    color = "#2C7FB8",  linewidth = 1  ) +  geom_point(    color = "#2C7FB8",    size = 2  ) +  scale_y_continuous(    labels = label_dollar()  ) +  scale_x_date(    date_labels = "%b %Y"  ) +  labs(    title = "Monthly Sales Trend", subtitle = "Sales aggregated by order month",    x = "Order Month",    y = "Total Sales"  ) +  theme(axis.text.x = element_text(      angle = 45,      hjust = 1    )  )

line_chart


#Area-----
area_chart <- ggplot(
  monthly_sales,
  aes(
    x = Month,
    y = Sales
  )
) +
  geom_area(
    fill = "#4C9F70",
    alpha = 0.7
  ) +
  geom_line(
    color = "#236B45",
    linewidth = 0.8
  ) +
  scale_y_continuous(
    labels = label_dollar()
  ) +
  scale_x_date(
    date_labels = "%b %Y"
  ) +
  labs(
    title = "Monthly Sales Area Chart",
    subtitle = "Sales volume over time",
    x = "Order Month",
    y = "Total Sales"
  ) +
  theme(
    axis.text.x = element_text(
      angle = 45,
      hjust = 1
    )
  )

area_chart


#Scatter----
order_performance <- orders1 %>%
  group_by(
    Order.ID,
    Region
  ) %>%
  summarise(
    Sales = sum(
      Sales,
      na.rm = TRUE
    ),
    Profit = sum(
      Profit,
      na.rm = TRUE
    ),
    .groups = "drop"
  )

scatter_plot <- ggplot(
  order_performance,
  aes(
    x = Sales,
    y = Profit,
    color = Region
  )
) +
  geom_hline(
    yintercept = 0,
    linetype = "dashed",
    color = "grey50"
  ) +
  geom_point(
    alpha = 0.65,
    size = 2
  ) +
  scale_x_continuous(
    labels = label_dollar()
  ) +
  scale_y_continuous(
    labels = label_dollar()
  ) +
  labs(
    title = "Order Sales versus Profit",
    subtitle = "Each point represents one order",
    x = "Order Sales",
    y = "Order Profit",
    color = "Region"
  ) +
  theme(
    legend.position = "bottom"
  )

scatter_plot

#histogram----
histogram <- ggplot(   orders1,   aes(    x = Sales  )
) +  geom_histogram(
    bins = 30,
    fill = "#377EB8",
    color = "white"
  ) +
  scale_x_continuous(
    labels = label_dollar()
  ) +
  labs(
    title = "Distribution of Sales",
    subtitle = "Frequency of sales values",
    x = "Sales",
    y = "Number of Records"
  )

histogram

#boxPlot-----
box_plot <- ggplot(
  orders1,
  aes(
    x = Category,
    y = Profit,
    fill = Category
  )
) +
  geom_hline(
    yintercept = 0,
    linetype = "dashed",
    color = "grey40"
  ) +
  geom_boxplot(
    show.legend = FALSE,
    outlier.alpha = 0.3
  ) +
  scale_y_continuous(
    labels = label_dollar()
  ) +
  labs(
    title = "Profit Distribution by Category",
    subtitle = "Median, spread and outliers",
    x = "Category",
    y = "Profit"
  )

box_plot

#heatmap-----
heatmap_data <- orders1 %>%
  group_by(
    Region,
    Category
  ) %>%
  summarise(
    Sales = sum(
      Sales,
      na.rm = TRUE
    ),
    .groups = "drop"
  )

heat_map <- ggplot(
  heatmap_data,
  aes(
    x = Region,
    y = Category,
    fill = Sales
  )
) +
  geom_tile(
    color = "white",
    linewidth = 1
  ) +
  geom_text(
    aes(
      label = dollar(
        Sales,
        accuracy = 1
      )
    ),
    color = "white",
    fontface = "bold"
  ) +
  scale_fill_gradient(
    low = "#9ECAE1",
    high = "#08519C",
    labels = label_dollar()
  ) +
  labs(
    title = "Sales Heat Map",
    subtitle = "Sales intensity by region and category",
    x = "Region",
    y = "Category",
    fill = "Sales"
  )

heat_map

