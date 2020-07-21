- dashboard: fisma
  title: FISMA
  layout: newspaper
  elements:
  - title: Investigation Summary
    name: Investigation Summary
    model: agg
    explore: agg_windows
    type: looker_pie
    fields: [sum_of_count, agg_windows.eventid]
    sorts: [sum_of_count desc]
    limit: 15
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
    row: 6
    col: 0
    width: 8
    height: 6
  - title: Investigation Trends
    name: Investigation Trends
    model: agg
    explore: agg_windows
    type: looker_line
    fields: [sum_of_count, agg_windows.type, agg_windows.date_date]
    pivots: [agg_windows.type]
    fill_fields: [agg_windows.date_date]
    sorts: [sum_of_count desc 0, agg_windows.type]
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    value_labels: legend
    label_type: labPer
    listen: {}
    row: 6
    col: 8
    width: 8
    height: 6
  - title: Top 10 Investigation Hosts
    name: Top 10 Investigation Hosts
    model: agg
    explore: agg_windows
    type: looker_pie
    fields: [sum_of_count, agg_windows.entity1]
    sorts: [sum_of_count desc]
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
    row: 6
    col: 16
    width: 8
    height: 6
  - title: Top 10 Investigation Users
    name: Top 10 Investigation Users
    model: agg
    explore: agg_windows
    type: looker_pie
    fields: [sum_of_count, agg_windows.entity2]
    sorts: [sum_of_count desc]
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
    row: 12
    col: 0
    width: 8
    height: 6
  - title: Investigation Details
    name: Investigation Details
    model: agg
    explore: agg_windows
    type: looker_grid
    fields: [agg_windows.type, agg_windows.date_date, agg_windows.count, agg_windows.hour,
      agg_windows.entity1, agg_windows.entity2]
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
    column_order: ["$$$_row_numbers_$$$", agg_windows.type, agg_windows.count, agg_windows.eventid,
      agg_windows.date_date, agg_windows.hour, agg_windows.entity1, agg_windows.entity2]
    show_totals: true
    show_row_totals: true
    series_labels:
      agg_windows.type: EventName
      agg_windows.date_date: EventDate
      agg_windows.entity1: ReporingHost
      agg_windows.entity2: SourceUserId
    series_types: {}
    defaults_version: 1
    listen: {}
    row: 12
    col: 8
    width: 16
    height: 6
  - title: Logoff Summary
    name: Logoff Summary
    model: agg
    explore: agg_windows
    type: looker_pie
    fields: [sum_of_count, agg_windows.eventid]
    filters:
      agg_windows.eventid: '4648,4634,4647,4625'
    sorts: [sum_of_count desc]
    limit: 15
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
    row: 21
    col: 0
    width: 8
    height: 6
  - title: Logoff Trends
    name: Logoff Trends
    model: agg
    explore: agg_windows
    type: looker_line
    fields: [sum_of_count, agg_windows.type, agg_windows.date_date]
    pivots: [agg_windows.type]
    fill_fields: [agg_windows.date_date]
    filters:
      agg_windows.eventid: '4648,4634,4647,4625'
    sorts: [sum_of_count desc 0, agg_windows.type]
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    value_labels: legend
    label_type: labPer
    listen: {}
    row: 21
    col: 8
    width: 8
    height: 6
  - title: Top 10 Logoff Users
    name: Top 10 Logoff Users
    model: agg
    explore: agg_windows
    type: looker_pie
    fields: [sum_of_count, agg_windows.entity1]
    filters:
      agg_windows.eventid: '4648,4634,4647,4625'
    sorts: [sum_of_count desc]
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
    row: 21
    col: 16
    width: 8
    height: 6
  - title: Top 10 Logoff Hosts
    name: Top 10 Logoff Hosts
    model: agg
    explore: agg_windows
    type: looker_pie
    fields: [sum_of_count, agg_windows.entity2]
    filters:
      agg_windows.eventid: '4648,4634,4647,4625'
    sorts: [sum_of_count desc]
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
    row: 27
    col: 0
    width: 8
    height: 6
  - title: Logoff Details
    name: Logoff Details
    model: agg
    explore: agg_windows
    type: looker_grid
    fields: [agg_windows.type, agg_windows.date_date, agg_windows.count, agg_windows.hour,
      agg_windows.entity1, agg_windows.entity2]
    filters:
      agg_windows.eventid: '4648,4634,4647,4625'
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
    column_order: ["$$$_row_numbers_$$$", agg_windows.type, agg_windows.count, agg_windows.eventid,
      agg_windows.date_date, agg_windows.hour, agg_windows.entity1, agg_windows.entity2]
    show_totals: true
    show_row_totals: true
    series_labels:
      agg_windows.type: EventName
      agg_windows.date_date: EventDate
      agg_windows.entity1: ReporingHost
      agg_windows.entity2: SourceUserId
    series_types: {}
    defaults_version: 1
    listen: {}
    row: 27
    col: 8
    width: 16
    height: 6
  - title: User Access & Least Privilege(Host Alerts by User)
    name: User Access & Least Privilege(Host Alerts by User)
    model: agg
    explore: agg_windows
    type: looker_line
    fields: [sum_of_count, agg_windows.date_date, agg_windows.ActionType3]
    pivots: [agg_windows.ActionType3]
    fill_fields: [agg_windows.date_date]
    filters:
      agg_windows.eventid: '4723,4724,4794,627,628,624,630,4720,4726,528,529,530,531,532,533,534,535,536,537,539,540,4624,4625,4634,4647,4648'
      agg_windows.entity2: "-NULL,--"
    sorts: [sum_of_count desc 0, agg_windows.ActionType3]
    limit: 15
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
    value_labels: legend
    label_type: labPer
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    listen: {}
    row: 51
    col: 0
    width: 13
    height: 6
  - title: File and Directory Change Event Trends
    name: File and Directory Change Event Trends
    model: agg
    explore: agg_windows
    type: looker_line
    fields: [sum_of_count, agg_windows.date_date, agg_windows.ActionType]
    pivots: [agg_windows.ActionType]
    fill_fields: [agg_windows.date_date]
    filters:
      agg_windows.eventid: '624,645,4720,4741,609,4705,625,642,685,4738,4742,4781'
    sorts: [sum_of_count desc 0]
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    value_labels: legend
    label_type: labPer
    listen: {}
    row: 39
    col: 8
    width: 8
    height: 6
  - title: User Access and Least Privilege Compliance Checks
    name: User Access and Least Privilege Compliance Checks
    model: agg
    explore: agg_windows
    type: looker_grid
    fields: [agg_windows.type, agg_windows.date_date, agg_windows.hour, sum_of_count,
      agg_windows.eventid, agg_windows.ActionType3]
    filters:
      agg_windows.eventid: '4723,4724,4794,627,628,624,630,4720,4726,528,529,530,531,532,533,534,535,536,537,539,540,4624,4625,4634,4647,4648'
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
    column_order: ["$$$_row_numbers_$$$", agg_windows.type, agg_windows.eventid, agg_windows.date_date,
      agg_windows.hour, agg_windows.ActionType, sum_of_count]
    show_totals: true
    show_row_totals: true
    series_labels:
      agg_windows.type: EventName
      agg_windows.date_date: EventDate
      agg_windows.entity1: ReporingHost
      agg_windows.entity2: SourceUserId
    series_types: {}
    defaults_version: 1
    listen: {}
    row: 45
    col: 0
    width: 11
    height: 6
  - title: Access Information and Changes
    name: Access Information and Changes
    model: agg
    explore: agg_windows
    type: looker_column
    fields: [sum_of_count, agg_windows.ActionType2]
    filters:
      agg_windows.eventid: '532,535,531,629,4725,577,578,4672,4673'
    sorts: [sum_of_count desc]
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
    series_types: {}
    defaults_version: 1
    listen: {}
    row: 39
    col: 16
    width: 8
    height: 6
  - title: Suspicious Access Activity
    name: Suspicious Access Activity
    model: agg
    explore: suspicious_access_activity
    type: looker_pie
    fields: [suspicious_access_activity.actiontype, sum_of_sumcount]
    sorts: [suspicious_access_activity.actiontype]
    limit: 500
    dynamic_fields: [{measure: sum_of_sumcount, based_on: suspicious_access_activity.sumcount,
        expression: '', label: Sum of Sumcount, type: sum, _kind_hint: measure, _type_hint: number}]
    value_labels: labels
    label_type: labPer
    series_types: {}
    defaults_version: 1
    listen: {}
    row: 51
    col: 13
    width: 11
    height: 6
  - title: Windows Account and Group Information
    name: Windows Account and Group Information
    model: agg
    explore: agg_windows
    type: looker_grid
    fields: [sum_of_count, agg_windows.type, agg_windows.ActionType3]
    filters:
      agg_windows.eventid: '528,540,4624'
    sorts: [sum_of_count desc]
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
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    listen: {}
    row: 45
    col: 11
    width: 13
    height: 6
  - title: File and Directory Change Event Summary
    name: File and Directory Change Event Summary
    model: agg
    explore: agg_windows
    type: looker_pie
    fields: [sum_of_count, agg_windows.eventid]
    filters:
      agg_windows.eventid: '4656,4658,4659,4660,4663,4664,4670,4691,4907'
      agg_windows.type: File
    sorts: [sum_of_count desc]
    limit: 15
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
    row: 60
    col: 0
    width: 8
    height: 6
  - title: File and Directory Change Event Trends
    name: File and Directory Change Event Trends (2)
    model: agg
    explore: agg_windows
    type: looker_line
    fields: [sum_of_count, agg_windows.type, agg_windows.date_date]
    pivots: [agg_windows.type]
    fill_fields: [agg_windows.date_date]
    filters:
      agg_windows.eventid: '4656,4658,4659,4660,4663,4664,4670,4691,4907'
      agg_windows.type: File
    sorts: [sum_of_count desc 0, agg_windows.type]
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    value_labels: legend
    label_type: labPer
    listen: {}
    row: 60
    col: 8
    width: 8
    height: 6
  - title: Top 10  Activities
    name: Top 10  Activities
    model: agg
    explore: agg_windows
    type: looker_pie
    fields: [sum_of_count, agg_windows.entity1]
    filters:
      agg_windows.eventid: '4656,4658,4659,4660,4663,4664,4670,4691,4907'
      agg_windows.type: File
    sorts: [sum_of_count desc]
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
    row: 60
    col: 16
    width: 8
    height: 6
  - title: Top 10 User Changes
    name: Top 10 User Changes
    model: agg
    explore: agg_windows
    type: looker_pie
    fields: [sum_of_count, agg_windows.entity2]
    filters:
      agg_windows.eventid: '4656,4658,4659,4660,4663,4664,4670,4691,4907'
      agg_windows.type: File
    sorts: [sum_of_count desc]
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
    row: 66
    col: 0
    width: 8
    height: 6
  - title: File and Directory Change Event Details
    name: File and Directory Change Event Details
    model: agg
    explore: agg_windows
    type: looker_grid
    fields: [agg_windows.date_date, agg_windows.count, agg_windows.hour, agg_windows.entity1,
      agg_windows.entity2]
    filters:
      agg_windows.eventid: '4656,4658,4659,4660,4663,4664,4670,4691,4907'
      agg_windows.type: File
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
    column_order: ["$$$_row_numbers_$$$", agg_windows.type, agg_windows.count, agg_windows.eventid,
      agg_windows.date_date, agg_windows.hour, agg_windows.entity1, agg_windows.entity2]
    show_totals: true
    show_row_totals: true
    series_labels:
      agg_windows.type: EventName
      agg_windows.date_date: EventDate
      agg_windows.entity1: ReporingHost
      agg_windows.entity2: SourceUserId
    series_types: {}
    defaults_version: 1
    listen: {}
    row: 66
    col: 8
    width: 16
    height: 6
  - name: FISMA
    type: text
    title_text: FISMA
    body_text: |-
      **FISMA**

      - **Identification and Authentication**
      - **Access Control**
      - **Audit and Accountability**
    row: 0
    col: 0
    width: 13
    height: 6
  - name: Identification and Authentication
    type: text
    title_text: Identification and Authentication
    body_text: "**The solution's Individual User Actions report shows you the complete\
      \ picture for user actions. It also provides detailed information on the W's\
      \ of auditing (i.e. who accessed the information, and when it was accessed).**"
    row: 0
    col: 13
    width: 11
    height: 6
  - name: Logon Failure
    type: text
    title_text: Logon Failure
    body_text: "**Records all unsuccessful logon attempts on the network. It provides\
      \ exhaustive information on logon failures such as who attempted to log on,\
      \ the date and time of the occurrence, and more**"
    row: 18
    col: 0
    width: 24
    height: 3
  - title: User Access & Least Privilege(Host Alerts by User) (copy)
    name: User Access & Least Privilege(Host Alerts by User) (copy)
    model: agg
    explore: agg_windows
    type: looker_grid
    fields: [sum_of_count, agg_windows.date_date, agg_windows.type, agg_windows.entity2,
      agg_windows.hour]
    filters:
      agg_windows.eventid: '4723,4724,4794,627,628,624,630,4720,4726,528,529,530,531,532,533,534,535,536,537,539,540,4624,4625,4634,4647,4648'
      agg_windows.entity2: "-NULL,--"
    sorts: [sum_of_count desc]
    limit: 15
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
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    value_labels: legend
    label_type: labPer
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    show_null_points: true
    interpolation: linear
    listen: {}
    row: 39
    col: 0
    width: 8
    height: 6
  - name: Audit and Accountability
    type: text
    title_text: Audit and Accountability
    body_text: "**This requirement demands continuous monitoring of access and activities\
      \ performed on the files and folders (objects) that store data**"
    row: 57
    col: 0
    width: 24
    height: 3
  - name: Access Control
    type: text
    title_text: Access Control
    body_text: "**EventLog Analyzer helps you monitor access to terminal servers,\
      \ Windows workstations, Linux and Unix servers, network devices, and more. This\
      \ solution provides detailed out of the box reports on Unsuccessful User Logons,\
      \ Successful User Logons and Logoffs, and more.**"
    row: 33
    col: 0
    width: 24
    height: 4
