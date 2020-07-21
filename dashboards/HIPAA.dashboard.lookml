- dashboard: hipaa_dashboard
  title: HIPAA Dashboard
  layout: newspaper
  elements:
  - title: Logon and Logoff Details
    name: Logon and Logoff Details
    model: agg
    explore: agg_windows
    type: looker_grid
    fields: [agg_windows.date_date, agg_windows.eventid, agg_windows.type, agg_windows.hour,
      agg_windows.entity1, agg_windows.entity2]
    filters:
      agg_windows.eventid: '4648,4624,4647,4634,4625'
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
      agg_windows.date_date: EventDate
      agg_windows.type: EventName
      agg_windows.entity1: ReportingHost
      agg_windows.entity2: SourceUserid
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
    listen: {}
    row: 15
    col: 8
    width: 16
    height: 7
  - title: System Events Details
    name: System Events Details
    model: agg
    explore: agg_windows
    type: looker_grid
    fields: [agg_windows.eventid, agg_windows.type, agg_windows.date_date, agg_windows.hour,
      agg_windows.entity1, agg_windows.entity2, sum_of_count]
    sorts: [agg_windows.date_date desc]
    limit: 500
    dynamic_fields: [{measure: sum_of_count, based_on: agg_windows.count, expression: '',
        label: Sum of Count, type: sum, _kind_hint: measure, _type_hint: number}]
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
      agg_windows.type: EventName
      agg_windows.date_date: EventDate
      agg_windows.entity1: ReportingHost
      agg_windows.entity2: SourceUserId
    series_cell_visualizations:
      sum_of_count:
        is_active: true
    series_types: {}
    defaults_version: 1
    listen: {}
    row: 32
    col: 8
    width: 16
    height: 6
  - title: Administrative Activities Details
    name: Administrative Activities Details
    model: agg
    explore: agg_windows
    type: looker_grid
    fields: [agg_windows.eventid, agg_windows.type, agg_windows.date_date, agg_windows.hour,
      agg_windows.entity1, agg_windows.entity2, sum_of_count]
    filters:
      agg_windows.eventid: '4726,644,4740,4738,4720,4704,630,624'
    sorts: [agg_windows.date_date desc]
    limit: 500
    dynamic_fields: [{measure: sum_of_count, based_on: agg_windows.count, expression: '',
        label: Sum of Count, type: sum, _kind_hint: measure, _type_hint: number}]
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
      agg_windows.type: EventName
      agg_windows.date_date: EventDate
      agg_windows.entity1: ReportingHost
      agg_windows.entity2: SourceUserId
    series_cell_visualizations:
      sum_of_count:
        is_active: true
    series_types: {}
    defaults_version: 1
    listen: {}
    row: 48
    col: 8
    width: 16
    height: 6
  - title: File Details
    name: File Details
    model: agg
    explore: agg_windows
    type: looker_grid
    fields: [agg_windows.eventid, agg_windows.type, agg_windows.date_date, agg_windows.hour,
      agg_windows.entity1, agg_windows.entity2, sum_of_count]
    filters:
      agg_windows.eventid: '4656,4658,4659,4660,4663,4664,4670,4691,4907'
      agg_windows.type: File
    sorts: [agg_windows.date_date desc]
    limit: 500
    dynamic_fields: [{measure: sum_of_count, based_on: agg_windows.count, expression: '',
        label: Sum of Count, type: sum, _kind_hint: measure, _type_hint: number}]
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
      agg_windows.type: EventName
      agg_windows.date_date: EventDate
      agg_windows.entity1: ReportingHost
      agg_windows.entity2: SourceUserId
    series_cell_visualizations:
      sum_of_count:
        is_active: true
    series_types: {}
    defaults_version: 1
    listen: {}
    row: 63
    col: 8
    width: 16
    height: 6
  - name: HIPAA
    type: text
    title_text: HIPAA
    body_text: |-
      **HIPAA**

      - **Logon and Logoff Monitoring**
      - **Account Logon**
      - **System Events**
      - **Object Access**
    row: 0
    col: 0
    width: 24
    height: 4
  - name: User Logon and Logoff Monitorning
    type: text
    title_text: User Logon and Logoff Monitorning
    body_text: "**HIPAA requirements 164.308 (a) (5) state that user access to the\
      \ system be recorded and monitored for possible abuse. This requirement, apart\
      \ from detecting the security breaches, allows IT security administrators to\
      \ document access to confidential medical details by legitimate users. Event\
      \ Log Analyzer's Successful User Logons and Logoffs report includes detailed\
      \ information such as the user name, date and time of the logon and logoff events,\
      \ reason for the logon failure, and more.**"
    row: 4
    col: 0
    width: 24
    height: 5
  - name: System Events
    type: text
    title_text: System Events
    body_text: "**Audit Logs Cleared: HIPAA requirement 164.308 (a) (3) calls for\
      \ procedures to review records of information system activity such as audit\
      \ logs regularly.**"
    row: 22
    col: 0
    width: 24
    height: 4
  - name: Account Logon
    type: text
    title_text: Account Logon
    body_text: "**Audit Logs Cleared: HIPAA requirement 164.308 (a) (3) calls for\
      \ procedures to review records of information system activity such as audit\
      \ logs regularly.**"
    row: 38
    col: 0
    width: 24
    height: 4
  - name: Object Access
    type: text
    title_text: Object Access
    body_text: 'Audit Logs Cleared: HIPAA requirement 164.308 (a) (3) calls for procedures
      to review records of information system activity such as audit logs regularly.'
    row: 54
    col: 0
    width: 24
    height: 3
  - title: Top 10 Hosts
    name: Top 10 Hosts
    model: agg
    explore: agg_windows
    type: looker_pie
    fields: [agg_windows.entity1, agg_windows.Sum_of_Count]
    filters:
      agg_windows.eventid: '4656,4658,4659,4660,4663,4664,4670,4691,4907'
      agg_windows.type: File
    limit: 10
    dynamic_fields: [{measure: sum_of_count, based_on: agg_windows.count, expression: '',
        label: Sum of Count, type: sum, _kind_hint: measure, _type_hint: number}]
    value_labels: labels
    label_type: labPer
    series_types: {}
    defaults_version: 1
    listen: {}
    row: 63
    col: 0
    width: 8
    height: 6
  - title: Top 10 Users
    name: Top 10 Users
    model: agg
    explore: agg_windows
    type: looker_pie
    fields: [agg_windows.entity2, agg_windows.Sum_of_Count]
    filters:
      agg_windows.entity2: "-NULL"
      agg_windows.eventid: '4656,4658,4659,4660,4663,4664,4670,4691,4907'
      agg_windows.type: File
    limit: 10
    dynamic_fields: [{measure: sum_of_count, based_on: agg_windows.count, expression: '',
        label: Sum of Count, type: sum, _kind_hint: measure, _type_hint: number}]
    value_labels: labels
    label_type: labPer
    series_types: {}
    defaults_version: 1
    listen: {}
    row: 57
    col: 16
    width: 8
    height: 6
  - title: Object Access Trends
    name: Object Access Trends
    model: agg
    explore: agg_windows
    type: looker_line
    fields: [agg_windows.type, agg_windows.date_date, agg_windows.Sum_of_Count]
    pivots: [agg_windows.type]
    fill_fields: [agg_windows.date_date]
    filters:
      agg_windows.eventid: '4656,4658,4659,4660,4663,4664,4670,4691,4907'
      agg_windows.type: File
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
    value_labels: legend
    label_type: labPer
    defaults_version: 1
    listen: {}
    row: 57
    col: 8
    width: 8
    height: 6
  - title: Object Access Summary
    name: Object Access Summary
    model: agg
    explore: agg_windows
    type: looker_pie
    fields: [agg_windows.type, agg_windows.Sum_of_Count]
    filters:
      agg_windows.eventid: '4656,4658,4659,4660,4663,4664,4670,4691,4907'
      agg_windows.type: File
    limit: 500
    dynamic_fields: [{measure: sum_of_count, based_on: agg_windows.count, expression: '',
        label: Sum of Count, type: sum, _kind_hint: measure, _type_hint: number}]
    value_labels: labels
    label_type: labPer
    series_types: {}
    defaults_version: 1
    listen: {}
    row: 57
    col: 0
    width: 8
    height: 6
  - title: Top 10 Administrative Activities Hosts
    name: Top 10 Administrative Activities Hosts
    model: agg
    explore: agg_windows
    type: looker_pie
    fields: [agg_windows.entity1, agg_windows.Sum_of_Count]
    filters:
      agg_windows.eventid: '4726,644,4740,4738,4720,4704,630,624'
    limit: 10
    dynamic_fields: [{measure: sum_of_count, based_on: agg_windows.count, expression: '',
        label: Sum of Count, type: sum, _kind_hint: measure, _type_hint: number}]
    value_labels: labels
    label_type: labPer
    series_types: {}
    defaults_version: 1
    listen: {}
    row: 48
    col: 0
    width: 8
    height: 6
  - title: Top 10 Administrative Activities Users
    name: Top 10 Administrative Activities Users
    model: agg
    explore: agg_windows
    type: looker_pie
    fields: [agg_windows.entity2, agg_windows.Sum_of_Count]
    filters:
      agg_windows.eventid: '4726,644,4740,4738,4720,4704,630,624'
      agg_windows.entity2: "-NULL"
    limit: 10
    dynamic_fields: [{measure: sum_of_count, based_on: agg_windows.count, expression: '',
        label: Sum of Count, type: sum, _kind_hint: measure, _type_hint: number}]
    value_labels: labels
    label_type: labPer
    series_types: {}
    defaults_version: 1
    listen: {}
    row: 42
    col: 16
    width: 8
    height: 6
  - title: Administrative Activities Trends
    name: Administrative Activities Trends
    model: agg
    explore: agg_windows
    type: looker_line
    fields: [agg_windows.type, agg_windows.date_date, agg_windows.Sum_of_Count]
    pivots: [agg_windows.type]
    fill_fields: [agg_windows.date_date]
    filters:
      agg_windows.eventid: '4726,644,4740,4738,4720,4704,630,624'
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
    value_labels: legend
    label_type: labPer
    defaults_version: 1
    listen: {}
    row: 42
    col: 8
    width: 8
    height: 6
  - title: Administrative Activities Summary
    name: Administrative Activities Summary
    model: agg
    explore: agg_windows
    type: looker_pie
    fields: [agg_windows.type, agg_windows.Sum_of_Count]
    filters:
      agg_windows.eventid: '4726,644,4740,4738,4720,4704,630,624'
    limit: 500
    dynamic_fields: [{measure: sum_of_count, based_on: agg_windows.count, expression: '',
        label: Sum of Count, type: sum, _kind_hint: measure, _type_hint: number}]
    value_labels: labels
    label_type: labPer
    series_types: {}
    defaults_version: 1
    listen: {}
    row: 42
    col: 0
    width: 8
    height: 6
  - title: System Events Hosts
    name: System Events Hosts
    model: agg
    explore: agg_windows
    type: looker_pie
    fields: [agg_windows.entity1, agg_windows.Sum_of_Count]
    filters:
      agg_windows.eventid: '4612,516'
    sorts: [agg_windows.Sum_of_Count desc]
    limit: 500
    dynamic_fields: [{measure: sum_of_count, based_on: agg_windows.count, expression: '',
        label: Sum of Count, type: sum, _kind_hint: measure, _type_hint: number}]
    value_labels: labels
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
    listen: {}
    row: 32
    col: 0
    width: 8
    height: 6
  - title: System Events Users
    name: System Events Users
    model: agg
    explore: agg_windows
    type: looker_pie
    fields: [agg_windows.entity2, agg_windows.Sum_of_Count]
    filters:
      agg_windows.eventid: '4612,516'
      agg_windows.source: "-NULL"
    sorts: [agg_windows.Sum_of_Count desc]
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
    listen: {}
    row: 26
    col: 16
    width: 8
    height: 6
  - title: System Events Trends
    name: System Events Trends
    model: agg
    explore: agg_windows
    type: looker_line
    fields: [agg_windows.type, agg_windows.date_date, agg_windows.Sum_of_Count]
    pivots: [agg_windows.type]
    fill_fields: [agg_windows.date_date]
    filters:
      agg_windows.eventid: '4612,516'
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
    y_axes: [{label: Count, orientation: left, series: [{axisId: sum_of_count, id: 'Internal
              resources allocated for the queuing of audit messages have been exhausted,
              leading to the loss of some audits - sum_of_count', name: 'Internal
              resources allocated for the queuing of audit messages have been exhausted,
              leading to the loss of some audits'}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_label: Event Date
    series_types: {}
    defaults_version: 1
    listen: {}
    row: 26
    col: 8
    width: 8
    height: 6
  - title: System Events Summary
    name: System Events Summary
    model: agg
    explore: agg_windows
    type: looker_pie
    fields: [agg_windows.type, agg_windows.Sum_of_Count]
    filters:
      agg_windows.eventid: '4612,516'
    sorts: [agg_windows.Sum_of_Count desc]
    limit: 500
    dynamic_fields: [{measure: sum_of_count, based_on: agg_windows.count, expression: '',
        label: Sum of Count, type: sum, _kind_hint: measure, _type_hint: number}]
    value_labels: legend
    label_type: labPer
    series_types: {}
    defaults_version: 1
    listen: {}
    row: 26
    col: 0
    width: 8
    height: 6
  - title: Logon and Logoff Summary
    name: Logon and Logoff Summary
    model: agg
    explore: agg_windows
    type: looker_pie
    fields: [agg_windows.type, agg_windows.Sum_of_Count]
    filters:
      agg_windows.eventid: '4648,4624,4647,4634,4625'
    sorts: [agg_windows.Sum_of_Count desc]
    limit: 500
    dynamic_fields: [{measure: sum_of_count, based_on: agg_windows.count, expression: '',
        label: Sum of Count, type: sum, _kind_hint: measure, _type_hint: number}]
    value_labels: labels
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
    listen: {}
    row: 9
    col: 0
    width: 8
    height: 6
  - title: Logon and Logoff Trends
    name: Logon and Logoff Trends
    model: agg
    explore: agg_windows
    type: looker_line
    fields: [agg_windows.date_date, agg_windows.type, agg_windows.Sum_of_Count]
    pivots: [agg_windows.type]
    fill_fields: [agg_windows.date_date]
    filters:
      agg_windows.eventid: '4648,4624,4647,4634,4625'
    sorts: [agg_windows.type desc, agg_windows.date_date desc]
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
    show_sql_query_menu_options: false
    column_order: []
    show_totals: true
    show_row_totals: true
    show_row_numbers: true
    transpose: false
    truncate_text: true
    size_to_fit: true
    series_labels:
      agg_windows.type: EventName
    series_cell_visualizations:
      sum_of_count:
        is_active: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    defaults_version: 1
    hide_totals: false
    hide_row_totals: false
    listen: {}
    row: 9
    col: 8
    width: 8
    height: 6
  - title: Top 10 Logon and Logoff Hosts
    name: Top 10 Logon and Logoff Hosts
    model: agg
    explore: agg_windows
    type: looker_pie
    fields: [agg_windows.entity1, agg_windows.Sum_of_Count]
    filters:
      agg_windows.eventid: '4648,4624,4647,4634,4625'
      agg_windows.source: "-NULL"
    sorts: [agg_windows.Sum_of_Count desc]
    limit: 10
    dynamic_fields: [{measure: sum_of_count, based_on: agg_windows.count, expression: '',
        label: Sum of Count, type: sum, _kind_hint: measure, _type_hint: number}]
    value_labels: labels
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
    listen: {}
    row: 9
    col: 16
    width: 8
    height: 6
  - title: Top 10 Logon and Logoff Users
    name: Top 10 Logon and Logoff Users
    model: agg
    explore: agg_windows
    type: looker_pie
    fields: [agg_windows.entity2, agg_windows.Sum_of_Count]
    filters:
      agg_windows.eventid: '4648,4624,4647,4634,4625'
      agg_windows.source: "-NULL"
      agg_windows.entity2: -"Null",--,-NULL
    limit: 10
    dynamic_fields: [{measure: sum_of_count, based_on: agg_windows.count, expression: '',
        label: Sum of Count, type: sum, _kind_hint: measure, _type_hint: number}]
    value_labels: labels
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
    listen: {}
    row: 15
    col: 0
    width: 8
    height: 7
