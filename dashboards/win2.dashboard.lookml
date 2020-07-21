- dashboard: windows_dashboard2
  title: windows Dashboard2
  layout: newspaper
  elements:
  - name: ''
    type: text
    body_text: |-
      <html>
      <body>
      <font color="#585b88" size="5"><center><b><i>User Account Added Or Removed Dashboard</i></b></font>
      </html>
      </body>
    row: 0
    col: 0
    width: 24
    height: 2
  - title: User Account Added Or Removed Details
    name: User Account Added Or Removed Details
    model: agg
    explore: agg_windows
    type: looker_grid
    fields: [agg_windows.date_date, agg_windows.eventid, agg_windows.type, agg_windows.hour,
      agg_windows.entity1, agg_windows.entity2]
    filters:
      agg_windows.eventid: '4726,4720,630,624'
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
      Date: agg_windows.date_date
    row: 19
    col: 0
    width: 24
    height: 5
  - name: " (2)"
    type: text
    body_text: |-
      <html>
      <body>
      <font color="#585b88" size="5"><center><b><i>Password Change Or Reset Dashboard</i></b></font>
      </html>
      </body>
    row: 24
    col: 0
    width: 24
    height: 2
  - title: Details
    name: Details
    model: agg
    explore: agg_windows
    type: looker_grid
    fields: [agg_windows.date_date, agg_windows.eventid, agg_windows.type, agg_windows.hour,
      agg_windows.entity1, agg_windows.entity2]
    filters:
      agg_windows.eventid: '4724,4723'
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
      Date: agg_windows.date_date
    row: 44
    col: 0
    width: 24
    height: 7
  - name: " (3)"
    type: text
    body_text: |-
      <html>
      <body>
      <font color="#585b88" size="5"><center><b><i>System Start Up And Shut Down Dashboard</i></b></font>
      </html>
      </body>
    row: 51
    col: 0
    width: 24
    height: 2
  - title: System Start Ups and Shut Downs Details
    name: System Start Ups and Shut Downs Details
    model: agg
    explore: agg_windows
    type: looker_grid
    fields: [agg_windows.date_date, agg_windows.eventid, agg_windows.type, agg_windows.hour,
      agg_windows.entity1, agg_windows.entity2]
    filters:
      agg_windows.eventid: '513,512,4609,4608'
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
      Date: agg_windows.date_date
    row: 69
    col: 0
    width: 24
    height: 3
  - name: " (4)"
    type: text
    body_text: |-
      <html>
      <body>
      <font color="#585b88" size="5"><center><b><i>Security Objects Deleted Dashboard</i></b></font>
      </html>
      </body>
    row: 72
    col: 0
    width: 24
    height: 2
  - title: Administrative Account Activities Details
    name: Administrative Account Activities Details
    model: agg
    explore: agg_windows
    type: looker_grid
    fields: [agg_windows.date_date, agg_windows.eventid, agg_windows.type, agg_windows.hour,
      agg_windows.entity1, agg_windows.entity2]
    filters:
      agg_windows.eventid: '4660,564'
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
      Date: agg_windows.date_date
    row: 90
    col: 0
    width: 24
    height: 6
  - name: " (5)"
    type: text
    body_text: |-
      <html>
      <body>
      <font color="#585b88" size="5"><center><b><i>Audit Message Dashboard
      </i></b></font>
      </html>
      </body>
    row: 96
    col: 0
    width: 24
    height: 2
  - title: Audit Message Details
    name: Audit Message Details
    model: agg
    explore: agg_windows
    type: looker_grid
    fields: [agg_windows.date_date, agg_windows.eventid, agg_windows.type, agg_windows.hour,
      agg_windows.entity1, agg_windows.entity2]
    filters:
      agg_windows.eventid: '4612,516'
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
      Date: agg_windows.date_date
    row: 116
    col: 0
    width: 24
    height: 7
  - title: User Account Added or Removed Summary
    name: User Account Added or Removed Summary
    model: agg
    explore: agg_windows
    type: looker_pie
    fields: [agg_windows.type, agg_windows.Sum_of_Count]
    filters:
      agg_windows.eventid: '4726,4720,630,624'
    limit: 500
    dynamic_fields: [{measure: totalsum, based_on: agg_windows.count, type: sum, label: Total(Sum),
        expression: !!null '', value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, _type_hint: number}]
    value_labels: legend
    label_type: labPer
    series_types: {}
    defaults_version: 1
    listen:
      Date: agg_windows.date_date
    row: 4
    col: 0
    width: 10
    height: 5
  - title: User Account Added or Removed Trends
    name: User Account Added or Removed Trends
    model: agg
    explore: agg_windows
    type: looker_line
    fields: [agg_windows.date_date, agg_windows.type, agg_windows.Sum_of_Count]
    pivots: [agg_windows.type]
    fill_fields: [agg_windows.date_date]
    filters:
      agg_windows.eventid: '4726,4720,630,624'
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
    defaults_version: 1
    listen:
      Date: agg_windows.date_date
    row: 4
    col: 10
    width: 14
    height: 5
  - title: Top 10 User Account Added Or Removed  Users
    name: Top 10 User Account Added Or Removed  Users
    model: agg
    explore: agg_windows
    type: looker_pie
    fields: [sourceuserid, agg_windows.Sum_of_Count]
    filters:
      agg_windows.eventid: '4726,4720,630,624'
    limit: 500
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
      Date: agg_windows.date_date
    row: 11
    col: 0
    width: 10
    height: 6
  - title: Top 10 User Account Added Or Removed Hosts
    name: Top 10 User Account Added Or Removed Hosts
    model: agg
    explore: agg_windows
    type: looker_pie
    fields: [reportinghost, agg_windows.Sum_of_Count]
    filters:
      agg_windows.eventid: '4726,4720,630,624'
      agg_windows.entity1: -"[Null]",-"[Empty]"
    limit: 500
    dynamic_fields: [{measure: totalsum, based_on: agg_windows.count, type: sum, label: Total(Sum),
        expression: !!null '', value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, _type_hint: number}, {dimension: reportinghost, label: Reportinghost,
        expression: "${agg_windows.entity1}", value_format: !!null '', value_format_name: !!null '',
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
      Date: agg_windows.date_date
    row: 11
    col: 10
    width: 14
    height: 6
  - title: Password Change Or Reset Summary
    name: Password Change Or Reset Summary
    model: agg
    explore: agg_windows
    type: looker_pie
    fields: [eventname, agg_windows.Sum_of_Count]
    filters:
      agg_windows.eventid: '4724,4723'
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
      Date: agg_windows.date_date
    row: 28
    col: 0
    width: 10
    height: 6
  - title: Password Change Or Reset Trends
    name: Password Change Or Reset Trends
    model: agg
    explore: agg_windows
    type: looker_line
    fields: [agg_windows.date_date, agg_windows.type, agg_windows.Sum_of_Count]
    pivots: [agg_windows.type]
    fill_fields: [agg_windows.date_date]
    filters:
      agg_windows.eventid: '4724,4723'
    sorts: [agg_windows.date_date desc]
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
      Date: agg_windows.date_date
    row: 28
    col: 10
    width: 14
    height: 6
  - title: Top 10 Password Change Or Reset Users
    name: Top 10 Password Change Or Reset Users
    model: agg
    explore: agg_windows
    type: looker_pie
    fields: [agg_windows.entity2, agg_windows.Sum_of_Count]
    filters:
      agg_windows.eventid: '4724,4723'
    limit: 500
    dynamic_fields: [{measure: totalsum, based_on: agg_windows.count, type: sum, label: Total(Sum),
        expression: !!null '', value_format: !!null '', value_format_name: !!null '',
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
      Date: agg_windows.date_date
    row: 36
    col: 0
    width: 10
    height: 6
  - title: Top 10 Password Change Or Reset Hosts
    name: Top 10 Password Change Or Reset Hosts
    model: agg
    explore: agg_windows
    type: looker_pie
    fields: [agg_windows.entity1, agg_windows.Sum_of_Count]
    filters:
      agg_windows.eventid: '4724,4723'
      agg_windows.entity1: -"[Null]",-"[Empty]"
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
    show_null_points: true
    interpolation: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    listen:
      Date: agg_windows.date_date
    row: 36
    col: 10
    width: 14
    height: 6
  - title: System Start Ups And Shut Downs Summary
    name: System Start Ups And Shut Downs Summary
    model: agg
    explore: agg_windows
    type: looker_pie
    fields: [agg_windows.type, agg_windows.Sum_of_Count]
    filters:
      agg_windows.eventid: '513,512,4609,4608'
    limit: 500
    dynamic_fields: [{measure: sum_of_count, based_on: agg_windows.count, expression: '',
        label: Sum of Count, type: sum, _kind_hint: measure, _type_hint: number}]
    value_labels: legend
    label_type: labPer
    show_view_names: false
    defaults_version: 1
    series_types: {}
    listen:
      Date: agg_windows.date_date
    row: 55
    col: 0
    width: 12
    height: 5
  - title: System Start Ups And Shut Downs Trends
    name: System Start Ups And Shut Downs Trends
    model: agg
    explore: agg_windows
    type: looker_line
    fields: [agg_windows.date_date, agg_windows.type, agg_windows.Sum_of_Count]
    pivots: [agg_windows.type]
    fill_fields: [agg_windows.date_date]
    filters:
      agg_windows.eventid: '513,512,4609,4608'
    sorts: [agg_windows.date_date desc]
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
    defaults_version: 1
    listen:
      Date: agg_windows.date_date
    row: 55
    col: 12
    width: 12
    height: 5
  - title: Top 10 System Start Ups And Shut Downs Users
    name: Top 10 System Start Ups And Shut Downs Users
    model: agg
    explore: agg_windows
    type: looker_pie
    fields: [agg_windows.entity2, agg_windows.Sum_of_Count]
    filters:
      agg_windows.eventid: '513,512,4609,4608'
    limit: 500
    dynamic_fields: [{measure: sum_of_count, based_on: agg_windows.count, expression: '',
        label: Sum of Count, type: sum, _kind_hint: measure, _type_hint: number}]
    value_labels: legend
    label_type: labPer
    series_types: {}
    defaults_version: 1
    listen:
      Date: agg_windows.date_date
    row: 62
    col: 0
    width: 12
    height: 5
  - title: Top 10 System Start Ups And Shut Downs hosts
    name: Top 10 System Start Ups And Shut Downs hosts
    model: agg
    explore: agg_windows
    type: looker_pie
    fields: [agg_windows.entity1, agg_windows.Sum_of_Count]
    filters:
      agg_windows.entity1: -"[Empty]"
      agg_windows.eventid: '513,512,4609,4608'
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
      Date: agg_windows.date_date
    row: 62
    col: 12
    width: 12
    height: 5
  - title: Administrative Account Activities Summary
    name: Administrative Account Activities Summary
    model: agg
    explore: agg_windows
    type: looker_pie
    fields: [agg_windows.type, agg_windows.Sum_of_Count]
    filters:
      agg_windows.eventid: '4660,564'
    sorts: [sum_of_count desc]
    limit: 500
    dynamic_fields: [{measure: sum_of_count, based_on: agg_windows.count, expression: '',
        label: Sum of Count, type: sum, _kind_hint: measure, _type_hint: number}]
    value_labels: legend
    label_type: labPer
    series_types: {}
    defaults_version: 1
    listen:
      Date: agg_windows.date_date
    row: 76
    col: 0
    width: 12
    height: 5
  - title: Administrative Account Activities Trends
    name: Administrative Account Activities Trends
    model: agg
    explore: agg_windows
    type: looker_line
    fields: [agg_windows.date_date, agg_windows.type, agg_windows.Sum_of_Count]
    pivots: [agg_windows.type]
    fill_fields: [agg_windows.date_date]
    filters:
      agg_windows.eventid: '4660,564'
    sorts: [agg_windows.date_date desc, agg_windows.type]
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
    defaults_version: 1
    listen:
      Date: agg_windows.date_date
    row: 76
    col: 12
    width: 12
    height: 5
  - title: Top 10 Administrative Account Activity Users
    name: Top 10 Administrative Account Activity Users
    model: agg
    explore: agg_windows
    type: looker_column
    fields: [agg_windows.entity2, agg_windows.Sum_of_Count]
    filters:
      agg_windows.eventid: '4660,564'
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen:
      Date: agg_windows.date_date
    row: 83
    col: 0
    width: 12
    height: 5
  - title: Top 10 Administrative Account Activity Hosts
    name: Top 10 Administrative Account Activity Hosts
    model: agg
    explore: agg_windows
    type: looker_pie
    fields: [agg_windows.entity1, agg_windows.Sum_of_Count]
    filters:
      agg_windows.eventid: '564'
    limit: 500
    dynamic_fields: [{measure: sum_of_count, based_on: agg_windows.count, expression: '',
        label: Sum of Count, type: sum, _kind_hint: measure, _type_hint: number}]
    value_labels: legend
    label_type: labPer
    series_types: {}
    defaults_version: 1
    listen:
      Date: agg_windows.date_date
    row: 83
    col: 12
    width: 12
    height: 5
  - title: Audit Message Summary
    name: Audit Message Summary
    model: agg
    explore: agg_windows
    type: looker_pie
    fields: [agg_windows.type, agg_windows.Sum_of_Count]
    filters:
      agg_windows.eventid: '4612,516'
    limit: 500
    dynamic_fields: [{measure: sum_of_count, based_on: agg_windows.count, expression: '',
        label: Sum of Count, type: sum, _kind_hint: measure, _type_hint: number}]
    value_labels: legend
    label_type: labPer
    series_types: {}
    defaults_version: 1
    listen:
      Date: agg_windows.date_date
    row: 100
    col: 0
    width: 10
    height: 6
  - title: Audit Message Trends
    name: Audit Message Trends
    model: agg
    explore: agg_windows
    type: looker_line
    fields: [agg_windows.date_date, agg_windows.type, agg_windows.Sum_of_Count]
    pivots: [agg_windows.type]
    fill_fields: [agg_windows.date_date]
    filters:
      agg_windows.eventid: '4612,516'
    sorts: [agg_windows.date_date desc]
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
    defaults_version: 1
    listen:
      Date: agg_windows.date_date
    row: 100
    col: 10
    width: 14
    height: 6
  - title: Top 10 Audit Message Users
    name: Top 10 Audit Message Users
    model: agg
    explore: agg_windows
    type: looker_pie
    fields: [agg_windows.entity2, agg_windows.Sum_of_Count]
    filters:
      agg_windows.eventid: '4612,516'
    limit: 500
    dynamic_fields: [{measure: sum_of_count, based_on: agg_windows.count, expression: '',
        label: Sum of Count, type: sum, _kind_hint: measure, _type_hint: number}]
    value_labels: legend
    label_type: labPer
    series_types: {}
    defaults_version: 1
    listen:
      Date: agg_windows.date_date
    row: 108
    col: 0
    width: 10
    height: 6
  - title: Top 10 Audit Message Hosts
    name: Top 10 Audit Message Hosts
    model: agg
    explore: agg_windows
    type: looker_pie
    fields: [agg_windows.entity1, agg_windows.Sum_of_Count]
    filters:
      agg_windows.eventid: '4612,516'
      agg_windows.entity1: -"[Null]",-"[Empty]"
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
      Date: agg_windows.date_date
    row: 108
    col: 10
    width: 14
    height: 6
  filters:
  - name: Date
    title: Date
    type: date_filter
    default_value: 60 days
    allow_multiple_values: true
    required: false
