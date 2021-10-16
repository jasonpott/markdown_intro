#Wrangle 

penguins %>% 
  filter(!is.na(sex)) %>% 
  group_by(species, island, sex) %>% 
  summarise(across(everything(), mean, na.rm=TRUE)) %>% 
  gt(rowname_col = 'sex') %>% 
  tab_header(
    title = "Stuff about penguins - grouped by species and island",
    subtitle = "Rows where sex was unknown removed"
  ) %>% 
  tab_source_note(
    source_note = md("Source:Horst AM, Hill AP, Gorman KB (2020). palmerpenguins: Palmer Archipelago (Antarctica) penguin data. R package version 0.1.0. ")
  ) %>% 
  tab_footnote(
    footnote = "blah blah",
    locations = cells_body(columns = sex, rows = c(2,4,6,8,10))
  ) %>% 
  tab_stubhead(label = "Penguin & Island") %>% 
  tab_spanner(label = 'Measurements',
              columns = c(bill_length_mm, bill_depth_mm,flipper_length_mm)) %>% 
  cols_label(
    bill_length_mm = html("Bill Length<br>(mm)"),
    bill_depth_mm = html("Bill Depth<br>(mm)"),
    flipper_length_mm = html("Flipper Length<br>(mm)"),
    body_mass_g = html("Body Mass<br>(g)"),
    year = html("Year<br>")
  ) %>% 
  fmt_number(columns = everything(),
             decimals = 0,
             sep_mark = "") -> tab_penguin_measure
