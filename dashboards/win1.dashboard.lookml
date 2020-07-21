- dashboard: windows_dashboard1
  title: Windows dashboard1
  layout: newspaper
  elements:
  - name: ''
    type: text
    title_text: ''
    body_text: |-
      <html>
      <body>
      <font color="#585b88" size="5"><center><b><i>Security Object Accessed Dashboard</i></b></font>
      </html>
      </body>
    row: 0
    col: 0
    width: 24
    height: 2
  - title: Security Object Accessed  Dashboard Details
    name: Security Object Accessed  Dashboard Details
    model: agg
    explore: agg_windows
    type: looker_grid
    fields: [agg_windows.date_date, agg_windows.eventid, agg_windows.type, agg_windows.date_hour_of_day,
      agg_windows.entity1, agg_windows.entity2, agg_windows.date_hour]
    filters:
      agg_windows.eventid: '4691,4662,4674,4663,4661,567,563,560'
    sorts: [agg_windows.date_date desc]
    limit: 500
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_labels:
      agg_windows.date_date: Eventdate
      agg_windows.type: Eventname
      agg_windows.date_hour_of_day: Hour
      agg_windows.entity1: Reportinghost
      agg_windows.entity2: Sourceuserid
    series_types: {}
    defaults_version: 1
    hidden_fields: [agg_windows.date_hour]
    listen:
      date: agg_windows.date_date
    row: 14
    col: 0
    width: 24
    height: 3
  - name: " (2)"
    type: text
    body_text: |-
      <html>
      <body>
      <font color="#585b88" size="5" ><center><b><i>USER LOGIN DASHBOARD</i></b></font>
      </html>
      </body>
    row: 17
    col: 0
    width: 24
    height: 2
  - name: " (3)"
    type: text
    body_text: |-
      <html>
      <body>
      <font color="#585b88" size="5"><center><b><i>Login Outside Business Hours Dashboard
      </i></b></font>
      </html>
      </body>
    row: 36
    col: 0
    width: 24
    height: 2
  - title: User Login Detais
    name: User Login Detais
    model: agg
    explore: agg_windows
    type: looker_grid
    fields: [agg_windows.date_date, agg_windows.eventid, agg_windows.type, agg_windows.hour,
      agg_windows.entity1, agg_windows.entity2]
    filters:
      agg_windows.eventid: '4624'
    sorts: [agg_windows.date_date desc]
    limit: 500
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_labels:
      agg_windows.date_date: Eventdate
      agg_windows.type: Eventname
      agg_windows.entity1: Reportinghost
      agg_windows.entity2: Sourceuserid
    series_types: {}
    defaults_version: 1
    listen:
      date: agg_windows.date_date
    row: 32
    col: 0
    width: 24
    height: 4
  - name: " (4)"
    type: text
    body_text: |-
      <html>
      <body>
      <font color="#585b88" size="5"><center><b><i>Privileged Commands Dashboard</i>
      </b></font>
      </html>
      </body>
    row: 59
    col: 0
    width: 24
    height: 2
  - title: Privileged Command Details
    name: Privileged Command Details
    model: agg
    explore: agg_windows
    type: looker_grid
    fields: [agg_windows.date_date, agg_windows.eventid, agg_windows.type, agg_windows.hour,
      agg_windows.entity1, agg_windows.entity2]
    filters:
      agg_windows.eventid: '4674,4672,4673,578,577'
    sorts: [agg_windows.date_date desc]
    limit: 500
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_labels:
      agg_windows.date_date: Eventdate
      agg_windows.type: Eventname
      agg_windows.entity1: Reportinghost
      agg_windows.entity2: Sourceuserid
    series_types: {}
    defaults_version: 1
    listen:
      date: agg_windows.date_date
    row: 76
    col: 0
    width: 24
    height: 5
  - name: " (5)"
    type: text
    body_text: |-
      <html>
      <body>
      <font color="#585b88" size="5"><center><b><i>Administrative Account Activities Dashboard</i></b></font>
      </html>
      </body>
    row: 81
    col: 0
    width: 24
    height: 2
  - title: Login Outside Business hours details
    name: Login Outside Business hours details
    model: agg
    explore: agg_windows
    type: looker_grid
    fields: [agg_windows.date_date, agg_windows.eventid, agg_windows.type, agg_windows.hour,
      agg_windows.entity1, agg_windows.entity2]
    filters:
      agg_windows.eventid: '4624'
      agg_windows.hour: "[18, 23]"
    sorts: [agg_windows.date_date desc]
    limit: 500
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_labels:
      agg_windows.date_date: Eventdate
      agg_windows.type: Eventname
      agg_windows.entity1: Reportinghost
      agg_windows.entity2: Sourceuserid
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    series_types: {}
    listen:
      date: agg_windows.date_date
    row: 54
    col: 0
    width: 24
    height: 5
  - title: Administrative Account Activities Details
    name: Administrative Account Activities Details
    model: agg
    explore: agg_windows
    type: looker_grid
    fields: [agg_windows.date_date, agg_windows.eventid, agg_windows.type, agg_windows.hour,
      agg_windows.entity1, agg_windows.entity2]
    filters:
      agg_windows.eventid: '4740,4738,4720,4704,630,624'
    limit: 500
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    defaults_version: 1
    listen:
      date: agg_windows.date_date
    row: 95
    col: 0
    width: 24
    height: 6
  - title: Security Object Accessed  Events
    name: Security Object Accessed  Events
    model: agg
    explore: agg_windows
    type: looker_pie
    fields: [agg_windows.type, agg_windows.Sum_of_Count]
    filters:
      agg_windows.eventid: '4691,4662,4674,4663,4661,567,563,560'
      agg_windows.type: "--"
    limit: 10
    dynamic_fields: [{measure: total, based_on: agg_windows.count, type: sum, label: Total,
        expression: !!null '', value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, _type_hint: number}]
    value_labels: legend
    label_type: labPer
    inner_radius:
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields: []
    series_types: {}
    listen:
      date: agg_windows.date_date
    row: 2
    col: 0
    width: 10
    height: 6
  - title: Security Object Accessed  Dashboard Trend
    name: Security Object Accessed  Dashboard Trend
    model: agg
    explore: agg_windows
    type: looker_line
    fields: [agg_windows.date_date, agg_windows.type, agg_windows.Sum_of_Count]
    pivots: [agg_windows.type]
    fill_fields: [agg_windows.date_date]
    filters:
      agg_windows.eventid: '4691,4662,4674,4663,4661,567,563,560'
      agg_windows.type: "--"
    sorts: [agg_windows.date_date, agg_windows.type]
    limit: 500
    dynamic_fields: [{dimension: eventname, label: Eventname, expression: "${agg_windows.type}",
        value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
        _type_hint: string}, {measure: total, based_on: agg_windows.count, type: sum,
        label: Total, expression: !!null '', value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, _type_hint: number}, {measure: sum_of_count, based_on: agg_windows.count,
        expression: '', label: Sum of Count, type: sum, _kind_hint: measure, _type_hint: number}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    hidden_series: [Privileged object operation - sum_of_count]
    series_types: {}
    series_colors:
      File - sum_of_count: "#B1399E"
      Key - sum_of_count: "#592EC2"
      Privileged object operation - sum_of_count: "#3EB0D5"
      Process - sum_of_count: "#72D16D"
    swap_axes: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    hidden_fields:
    listen:
      date: agg_windows.date_date
    row: 2
    col: 10
    width: 14
    height: 6
  - title: Top 10 users
    name: Top 10 users
    model: agg
    explore: agg_windows
    type: looker_pie
    fields: [agg_windows.entity2, agg_windows.Sum_of_Count]
    filters:
      agg_windows.eventid: '560,4662,4674,563,567,4661,4663,4691'
    limit: 10
    dynamic_fields: [{dimension: sourceuserid, label: Sourceuserid, expression: "${agg_windows.entity2}",
        value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
        _type_hint: string}, {measure: total, based_on: agg_windows.count, type: sum,
        label: Total, expression: !!null '', value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, _type_hint: number}]
    value_labels: legend
    label_type: labPer
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    series_types: {}
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    listen:
      date: agg_windows.date_date
    row: 8
    col: 0
    width: 10
    height: 6
  - title: Top 10 Hosts
    name: Top 10 Hosts
    model: agg
    explore: agg_windows
    type: looker_pie
    fields: [agg_windows.entity1, agg_windows.Sum_of_Count]
    filters:
      agg_windows.eventid: '560,4662,4674,563,567,4661,4663,4691'
      agg_windows.type: -"[Null]",-"[Empty]"
    limit: 10
    dynamic_fields: [{dimension: reportinghost, label: Reportinghost, expression: "${agg_windows.entity1}",
        value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
        _type_hint: string}, {measure: totalsum, based_on: agg_windows.count, type: sum,
        label: Total(sum), expression: !!null '', value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, _type_hint: number}]
    value_labels: legend
    label_type: labPer
    series_types: {}
    defaults_version: 1
    listen:
      date: agg_windows.date_date
    row: 8
    col: 10
    width: 14
    height: 6
  - title: User Login Events
    name: User Login Events
    model: agg
    explore: agg_windows
    type: looker_pie
    fields: [agg_windows.type, agg_windows.Sum_of_Count]
    filters:
      agg_windows.eventid: '4624'
    limit: 500
    dynamic_fields: [{measure: sum_of_count, based_on: agg_windows.count, expression: '',
        label: Sum of Count, type: sum, _kind_hint: measure, _type_hint: number}]
    value_labels: legend
    label_type: labPer
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    listen:
      date: agg_windows.date_date
    row: 19
    col: 0
    width: 10
    height: 6
  - title: User Login Trends
    name: User Login Trends
    model: agg
    explore: agg_windows
    type: looker_line
    fields: [agg_windows.date_date, agg_windows.type, agg_windows.Sum_of_Count]
    pivots: [agg_windows.type]
    fill_fields: [agg_windows.date_date]
    filters:
      agg_windows.eventid: '4624'
    sorts: [agg_windows.type]
    limit: 500
    dynamic_fields: [{measure: sum_of_count, based_on: agg_windows.count, expression: '',
        label: Sum of Count, type: sum, _kind_hint: measure, _type_hint: number}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    series_types: {}
    series_labels:
      sum_of_count: Total(sum)
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    listen:
      date: agg_windows.date_date
    row: 19
    col: 10
    width: 14
    height: 6
  - title: Top 10 User Login Users
    name: Top 10 User Login Users
    model: agg
    explore: agg_windows
    type: looker_pie
    fields: [sourceuserid, agg_windows.Sum_of_Count]
    filters:
      agg_windows.entity2: -"[Null]",--
      agg_windows.eventid: '4624'
    limit: 10
    dynamic_fields: [{measure: totalsum, based_on: agg_windows.count, type: sum, label: Total(Sum),
        expression: !!null '', value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, _type_hint: number}, {dimension: sourceuserid, label: Sourceuserid,
        expression: "${agg_windows.entity2}", value_format: !!null '', value_format_name: !!null '',
        _kind_hint: dimension, _type_hint: string}]
    value_labels: legend
    label_type: labPer
    series_types: {}
    defaults_version: 1
    listen:
      date: agg_windows.date_date
    row: 25
    col: 0
    width: 10
    height: 7
  - title: Top 10 hosts User Login
    name: Top 10 hosts User Login
    model: agg
    explore: agg_windows
    type: looker_pie
    fields: [reportinghost, agg_windows.Sum_of_Count]
    filters:
      agg_windows.entity1: -"[Null]",-"[Empty]"
    limit: 10
    dynamic_fields: [{dimension: reportinghost, label: Reportinghost, expression: "${agg_windows.entity1}",
        value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
        _type_hint: string}, {measure: totalsum, based_on: agg_windows.count, type: sum,
        label: Total(Sum), expression: !!null '', value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, _type_hint: number}]
    value_labels: legend
    label_type: labPer
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    listen:
      date: agg_windows.date_date
    row: 25
    col: 10
    width: 14
    height: 7
  - title: Login Outside Business Hours Summary
    name: Login Outside Business Hours Summary
    model: agg
    explore: agg_windows
    type: looker_pie
    fields: [eventname, agg_windows.Sum_of_Count]
    filters:
      agg_windows.hour: "[18, 23]"
      agg_windows.eventid: '4624'
    limit: 500
    dynamic_fields: [{measure: totalsum, based_on: agg_windows.count, type: sum, label: Total(Sum),
        expression: !!null '', value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, _type_hint: number}, {dimension: eventname, label: Eventname,
        expression: "${agg_windows.type}", value_format: !!null '', value_format_name: !!null '',
        _kind_hint: dimension, _type_hint: string}]
    value_labels: legend
    label_type: labPer
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    listen:
      date: agg_windows.date_date
    row: 38
    col: 0
    width: 10
    height: 7
  - title: Login Outside Business Hours Trends
    name: Login Outside Business Hours Trends
    model: agg
    explore: agg_windows
    type: looker_line
    fields: [agg_windows.date_date, agg_windows.type, agg_windows.Sum_of_Count]
    pivots: [agg_windows.type]
    fill_fields: [agg_windows.date_date]
    filters:
      agg_windows.eventid: '4624'
      agg_windows.hour: "[18, 23]"
    sorts: [agg_windows.date_date desc, agg_windows.type]
    limit: 500
    dynamic_fields: [{dimension: eventname, label: Eventname, expression: "${agg_windows.type}",
        value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
        _type_hint: string}, {measure: totalsum, based_on: agg_windows.count, type: sum,
        label: Total(Sum), expression: !!null '', value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, _type_hint: number}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    series_types: {}
    defaults_version: 1
    listen:
      date: agg_windows.date_date
    row: 38
    col: 10
    width: 14
    height: 7
  - title: Top 10 Login Outside Business Hours Users
    name: Top 10 Login Outside Business Hours Users
    model: agg
    explore: agg_windows
    type: looker_pie
    fields: [sourceuserid, agg_windows.Sum_of_Count]
    filters:
      agg_windows.entity2: -"[Null]",--
      agg_windows.hour: "[18, 23]"
      agg_windows.eventid: '4624'
    limit: 10
    dynamic_fields: [{dimension: sourceuserid, label: Sourceuserid, expression: "${agg_windows.entity2}",
        value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
        _type_hint: string}, {measure: totalsum, based_on: agg_windows.count, type: sum,
        label: Total(Sum), expression: !!null '', value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, _type_hint: number}]
    value_labels: legend
    label_type: labPer
    series_types: {}
    defaults_version: 1
    listen:
      date: agg_windows.date_date
    row: 45
    col: 0
    width: 10
    height: 9
  - title: Top 10 Login Outside Business Hours Hosts
    name: Top 10 Login Outside Business Hours Hosts
    model: agg
    explore: agg_windows
    type: looker_pie
    fields: [reportinghost, agg_windows.Sum_of_Count]
    filters:
      agg_windows.entity1: -"[Null]",-"[Empty]"
      agg_windows.hour: "[0, 8]"
    limit: 10
    dynamic_fields: [{dimension: reportinghost, label: Reportinghost, expression: "${agg_windows.entity1}",
        value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
        _type_hint: string}, {measure: totalsum, based_on: agg_windows.count, type: sum,
        label: Total(Sum), expression: !!null '', value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, _type_hint: number}]
    value_labels: legend
    label_type: labPer
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    listen:
      date: agg_windows.date_date
    row: 45
    col: 10
    width: 14
    height: 9
  - title: Privileged Commands  Summary
    name: Privileged Commands  Summary
    model: agg
    explore: agg_windows
    type: looker_pie
    fields: [eventname, agg_windows.Sum_of_Count]
    filters:
      agg_windows.eventid: '4674,4672,4673,578,577'
      agg_windows.type: "--"
    limit: 500
    dynamic_fields: [{measure: totalsum, based_on: agg_windows.count, type: sum, label: Total(Sum),
        expression: !!null '', value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, _type_hint: number}, {dimension: eventname, label: Eventname,
        expression: "${agg_windows.type}", value_format: !!null '', value_format_name: !!null '',
        _kind_hint: dimension, _type_hint: string}]
    value_labels: legend
    label_type: labPer
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    listen:
      date: agg_windows.date_date
    row: 61
    col: 0
    width: 10
    height: 6
  - title: Privileged Commands Trends
    name: Privileged Commands Trends
    model: agg
    explore: agg_windows
    type: looker_line
    fields: [agg_windows.date_date, agg_windows.type, agg_windows.Sum_of_Count]
    pivots: [agg_windows.type]
    fill_fields: [agg_windows.date_date]
    filters:
      agg_windows.eventid: '4674,4672,4673,578,577'
      agg_windows.type: "--"
    sorts: [agg_windows.date_date desc, agg_windows.type]
    limit: 500
    dynamic_fields: [{dimension: eventname, label: Eventname, expression: "${agg_windows.type}",
        value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
        _type_hint: string}, {measure: totalsum, based_on: agg_windows.count, type: sum,
        label: Total(Sum), expression: !!null '', value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, _type_hint: number}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    series_types: {}
    series_colors:
      Privileged object operation - totalsum: "#3EB0D5"
      A privileged service was called - totalsum: "#B1399E"
      Special privileges assigned to new logon - totalsum: "#72D16D"
    series_labels:
      agg_windows.count: Total
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    value_labels: legend
    label_type: labPer
    hidden_fields: []
    listen:
      date: agg_windows.date_date
    row: 61
    col: 10
    width: 14
    height: 6
  - title: Top 10 Privileged Command Users
    name: Top 10 Privileged Command Users
    model: agg
    explore: agg_windows
    type: looker_pie
    fields: [sourceuserid, agg_windows.Sum_of_Count]
    filters:
      agg_windows.eventid: '4674,4672,4673,578,577'
    limit: 10
    dynamic_fields: [{dimension: sourceuserid, label: Sourceuserid, expression: "${agg_windows.entity2}",
        value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
        _type_hint: string}, {measure: totalsum, based_on: agg_windows.count, type: sum,
        label: Total(Sum), expression: !!null '', value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, _type_hint: number}]
    value_labels: legend
    label_type: labPer
    series_types: {}
    defaults_version: 1
    listen:
      date: agg_windows.date_date
    row: 67
    col: 0
    width: 10
    height: 9
  - title: Top 10 Privileged Command Hosts
    name: Top 10 Privileged Command Hosts
    model: agg
    explore: agg_windows
    type: looker_pie
    fields: [reportinghost, agg_windows.Sum_of_Count]
    filters:
      agg_windows.entity1: -"[Null]",-"[Empty]"
      agg_windows.eventid: '4674,4672,4673,578,577'
    limit: 10
    dynamic_fields: [{dimension: reportinghost, label: Reportinghost, expression: "${agg_windows.entity1}",
        value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
        _type_hint: string}, {measure: totalsum, based_on: agg_windows.count, type: sum,
        label: Total(sum), expression: !!null '', value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, _type_hint: number}]
    value_labels: legend
    label_type: labPer
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    listen:
      date: agg_windows.date_date
    row: 67
    col: 10
    width: 14
    height: 9
  - title: Adminnistrative Account Activities Summmary
    name: Adminnistrative Account Activities Summmary
    model: agg
    explore: agg_windows
    type: looker_pie
    fields: [agg_windows.type, agg_windows.Sum_of_Count]
    filters:
      agg_windows.eventid: '4740,4738,4720,4704,630,624'
    sorts: [agg_windows.type]
    limit: 10
    dynamic_fields: [{measure: totalsum, based_on: agg_windows.count, type: sum, label: Total(Sum),
        expression: !!null '', value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, _type_hint: number}, {dimension: eventname, label: Eventname,
        expression: "${agg_windows.type}", value_format: !!null '', value_format_name: !!null '',
        _kind_hint: dimension, _type_hint: string}]
    value_labels: legend
    label_type: labPer
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    listen:
      date: agg_windows.date_date
    row: 83
    col: 0
    width: 9
    height: 6
  - title: Administrative Account Activities Trends
    name: Administrative Account Activities Trends
    model: agg
    explore: agg_windows
    type: looker_line
    fields: [agg_windows.date_date, agg_windows.type, agg_windows.Sum_of_Count]
    pivots: [agg_windows.type]
    fill_fields: [agg_windows.date_date]
    filters:
      agg_windows.eventid: '4740,4738,4720,4704,630,624'
    sorts: [agg_windows.date_date desc, agg_windows.type]
    limit: 500
    dynamic_fields: [{measure: totalsum, based_on: agg_windows.count, type: sum, label: Total(Sum),
        expression: !!null '', value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, _type_hint: number}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    series_types: {}
    defaults_version: 1
    listen:
      date: agg_windows.date_date
    row: 83
    col: 9
    width: 15
    height: 6
  - title: Top 10 Administrative Account Activities Users
    name: Top 10 Administrative Account Activities Users
    model: agg
    explore: agg_windows
    type: looker_column
    fields: [sourceuserid, agg_windows.Sum_of_Count]
    filters:
      agg_windows.eventid: '4740,4738,4720,4704,630,624'
    limit: 500
    dynamic_fields: [{measure: totalsum, based_on: agg_windows.count, type: sum, label: Total(Sum),
        expression: !!null '', value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, _type_hint: number}, {dimension: sourceuserid, label: Sourceuserid,
        expression: "${agg_windows.entity2}", value_format: !!null '', value_format_name: !!null '',
        _kind_hint: dimension, _type_hint: string}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen:
      date: agg_windows.date_date
    row: 89
    col: 0
    width: 9
    height: 6
  - title: Top 10 Administrative Account Activities Hosts
    name: Top 10 Administrative Account Activities Hosts
    model: agg
    explore: agg_windows
    type: looker_column
    fields: [reportinghost, agg_windows.Sum_of_Count]
    filters:
      agg_windows.entity1: -"[Null]",-"[Empty]"
      agg_windows.eventid: '4740,4738,4720,4704,630,624'
    limit: 500
    dynamic_fields: [{measure: totalsum, based_on: agg_windows.count, type: sum, label: Total(Sum),
        expression: !!null '', value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, _type_hint: number}, {dimension: reportinghost, label: Reportinghost,
        expression: "${agg_windows.entity1}", value_format: !!null '', value_format_name: !!null '',
        _kind_hint: dimension, _type_hint: string}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen:
      date: agg_windows.date_date
    row: 89
    col: 9
    width: 15
    height: 6
  filters:
  - name: date
    title: date
    type: date_filter
    default_value: 7 days
    allow_multiple_values: true
    required: false
