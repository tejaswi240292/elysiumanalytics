- dashboard: alerts_dashboard
  title: Alerts_Dashboard
  layout: newspaper
  elements:
  - title: New Alerts By Severity
    name: New Alerts By Severity
    model: alerts
    explore: alerts_view
    type: looker_bar
    fields: [alerts_view.count, alerts_view.severity]
    pivots: [alerts_view.severity]
    filters: {}
    sorts: [alerts_view.count desc 0, alerts_view.severity]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: right
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: bottom, series: [{axisId: alerts_view.count,
            id: 1 - alerts_view.count, name: low}, {axisId: alerts_view.count, id: 2
              - alerts_view.count, name: medium}, {axisId: alerts_view.count, id: 3
              - alerts_view.count, name: high}, {axisId: alerts_view.count, id: 5
              - alerts_view.count, name: critical}], showLabels: false, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: log}]
    series_types: {}
    series_colors:
      5 - alerts_view.count: "#B32F37"
      3 - alerts_view.count: "#E57947"
      2 - alerts_view.count: "#FFD95F"
      1 - alerts_view.count: "#3EB0D5"
    series_labels:
      alerts_view.count: New Alerts
      1 - alerts_view.count: low
      2 - alerts_view.count: medium
      3 - alerts_view.count: high
      5 - alerts_view.count: critical
    defaults_version: 1
    hidden_fields: []
    listen:
      date: alerts_view.datefilter
      alert_name: alerts_view.alert_abbr_nm
      Severity: alerts_view.severity
    row: 0
    col: 5
    width: 9
    height: 5
  - title: New Alerts
    name: New Alerts
    model: alerts
    explore: alerts_view
    type: looker_line
    fields: [alerts_view.count, alerts_view.event_time_date]
    fill_fields: [alerts_view.event_time_date]
    filters: {}
    sorts: [alerts_view.event_time_date desc]
    limit: 500
    dynamic_fields: [{table_calculation: total_count, label: Total Count, expression: "${alerts_view.count}-offset(${alerts_view.count},1)",
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number, is_disabled: true}]
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
    y_axes: [{label: Alerts, orientation: left, series: [{axisId: alerts_view.count,
            id: alerts_view.count, name: Alerts View}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_label: ''
    series_types: {}
    series_colors:
      alerts_view.count: "#B32F37"
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: true
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Total Count
    value_format: ''
    comparison_label: ''
    defaults_version: 1
    hidden_fields: []
    listen:
      date: alerts_view.datefilter
      alert_name: alerts_view.alert_abbr_nm
      Severity: alerts_view.severity
    row: 0
    col: 0
    width: 5
    height: 5
  - title: User Alerts For 7 days
    name: User Alerts For 7 days
    model: alerts
    explore: alerts_view
    type: table
    fields: [alerts_view.event_time_date, alerts_view.count, alerts_view.src_username]
    pivots: [alerts_view.event_time_date]
    filters:
      alerts_view.count: "[1, 5]"
    sorts: [alerts_view.count desc 0, alerts_view.event_time_date]
    limit: 500
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_labels:
      alerts_view.src_username: Name
      alerts_view.count: Count
      alerts_view.event_time_date: DATE GEN
    conditional_formatting: [{type: not equal to, value: 0, background_color: "#B32F37",
        font_color: !!null '', color_application: {collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7,
          palette_id: 85de97da-2ded-4dec-9dbd-e6a7d36d5825}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}, {type: equal to, value: 0, background_color: "#cfd6be",
        font_color: !!null '', color_application: {collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7,
          palette_id: 85de97da-2ded-4dec-9dbd-e6a7d36d5825}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
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
    hidden_fields: []
    y_axes: []
    listen:
      date: alerts_view.datefilter
      alert_name: alerts_view.alert_abbr_nm
      Severity: alerts_view.severity
    row: 18
    col: 0
    width: 24
    height: 8
  - title: DETAILED VIEW
    name: DETAILED VIEW
    model: alerts
    explore: alerts_view
    type: table
    fields: [alerts_view.event_time_date, alerts_view.src_username, alerts_view.alert_desc,
      alerts_view.alert_type, alerts_view.id, alerts_view.parent_alert_id, alerts_view.source_nm,
      alerts_view.src_ip, alerts_view.dst_ip, alerts_view.hostname, alerts_view.alert_abbr_nm]
    filters:
      alerts_view.alert_type: ''
    sorts: [alerts_view.event_time_date desc]
    limit: 500
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    transpose: false
    truncate_text: true
    size_to_fit: true
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    defaults_version: 1
    series_types: {}
    hidden_fields: []
    y_axes: []
    listen:
      date: alerts_view.datefilter
      alert_name: alerts_view.alert_abbr_nm
      Severity: alerts_view.severity
    row: 32
    col: 0
    width: 24
    height: 11
  - title: Alert types for last 7 days
    name: Alert types for last 7 days
    model: alerts
    explore: alerts_view
    type: table
    fields: [alerts_view.count, alerts_view.event_time_date, alerts_view.Alert_Abbreviation_Name]
    pivots: [alerts_view.event_time_date]
    filters:
      alerts_view.count: "[1, 1666]"
    sorts: [alerts_view.count desc 0, alerts_view.event_time_date]
    limit: 500
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_labels:
      alerts_view.count: Count
      alerts_view.event_time_date: DATE GEN
      alerts_view.alerts_view.Alert_Abbreviation_Name: Type
    conditional_formatting: [{type: not equal to, value: 0, background_color: "#b2231f",
        font_color: !!null '', color_application: {collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7,
          palette_id: 85de97da-2ded-4dec-9dbd-e6a7d36d5825}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}, {type: equal to, value: 0, background_color: "#d6d6b7",
        font_color: !!null '', color_application: {collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7,
          palette_id: 85de97da-2ded-4dec-9dbd-e6a7d36d5825}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    series_types: {}
    defaults_version: 1
    hidden_fields: []
    y_axes: []
    listen:
      date: alerts_view.datefilter
      alert_name: alerts_view.Alert_Abbreviation_Name
      Severity: alerts_view.severity
    row: 13
    col: 0
    width: 24
    height: 5
  - title: Alerts Origination From Geo
    name: Alerts Origination From Geo
    model: alerts
    explore: alerts_view
    type: looker_map
    fields: [alerts_view.location, alerts_view.count]
    filters: {}
    sorts: [alerts_view.count desc]
    limit: 500
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: fit_data
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_view_names: false
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    series_types: {}
    defaults_version: 1
    hidden_fields: []
    y_axes: []
    listen:
      date: alerts_view.datefilter
      alert_name: alerts_view.Alert_Abbreviation_Name
      Severity: alerts_view.severity
    row: 5
    col: 12
    width: 12
    height: 8
  - title: ALERTS DATA
    name: ALERTS DATA
    model: alerts
    explore: alerts_view
    type: table
    fields: [alerts_view.event_time_minute, alerts_view.src_username, alerts_view.alert_type,
      alerts_view.alert_desc, alerts_view.Alert_Abbreviation_Name, alerts_view.count]
    filters: {}
    sorts: [alerts_view.event_time_minute desc]
    limit: 500
    total: true
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    transpose: false
    truncate_text: true
    size_to_fit: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_labels:
      alerts_view.count: Alert Count
    series_cell_visualizations:
      alerts_view.count:
        is_active: false
    series_types: {}
    defaults_version: 1
    hidden_fields: []
    y_axes: []
    listen:
      date: alerts_view.datefilter
      alert_name: alerts_view.Alert_Abbreviation_Name
      Severity: alerts_view.severity
    row: 26
    col: 0
    width: 24
    height: 6
  - title: Alerts by Source
    name: Alerts by Source
    model: alerts
    explore: alerts_view
    type: looker_line
    fields: [alerts_view.source_nm, alerts_view.count, alerts_view.event_date]
    pivots: [alerts_view.source_nm]
    fill_fields: [alerts_view.event_date]
    filters: {}
    sorts: [alerts_view.source_nm, alerts_view.event_date desc]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: right
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: alerts_view.count, id: msexchange
              - alerts_view.count, name: msexchange}, {axisId: alerts_view.count,
            id: wgevent - alerts_view.count, name: wgevent}, {axisId: alerts_view.count,
            id: wgtraffic - alerts_view.count, name: wgtraffic}, {axisId: alerts_view.count,
            id: windowsnxlog - alerts_view.count, name: windowsnxlog}], showLabels: false,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    series_types: {}
    defaults_version: 1
    hidden_fields: []
    listen:
      date: alerts_view.datefilter
      alert_name: alerts_view.Alert_Abbreviation_Name
      Severity: alerts_view.severity
    row: 5
    col: 0
    width: 12
    height: 8
  - title: New Alerts By Type
    name: New Alerts By Type
    model: alerts
    explore: alerts_view
    type: looker_column
    fields: [alerts_view.count, alerts_view.Alert_Abbreviation_Name]
    pivots: [alerts_view.Alert_Abbreviation_Name]
    filters: {}
    sorts: [alerts_view.count desc 0, alerts_view.alert_abbr_nm]
    limit: 500
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
    legend_position: right
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
    color_application:
      collection_id: 9d1da669-a6b4-4a4f-8519-3ea8723b79b5
      palette_id: 0c5264fb-0681-4817-b9a5-d3c81002ce4c
      options:
        steps: 5
    y_axes: [{label: Alerts Count, orientation: left, series: [{axisId: alerts_view.count,
            id: anomaly - alerts_view.count, name: anomaly}, {axisId: alerts_view.count,
            id: Deleted files - alerts_view.count, name: Deleted files}, {axisId: alerts_view.count,
            id: New Email Sender - alerts_view.count, name: New Email Sender}, {axisId: alerts_view.count,
            id: New Windows User - alerts_view.count, name: New Windows User}, {axisId: alerts_view.count,
            id: Session exceeded the Download Bytes Limit for wgnetflow - alerts_view.count,
            name: Session exceeded the Download Bytes Limit for wgnetflow}, {axisId: alerts_view.count,
            id: Session exceeded the Download Bytes Limit for wgtraffic - alerts_view.count,
            name: Session exceeded the Download Bytes Limit for wgtraffic}, {axisId: alerts_view.count,
            id: User Accessed New Destination Port - alerts_view.count, name: User
              Accessed New Destination Port}, {axisId: alerts_view.count, id: Watchguard
              Event and Alarms Malware Detected - alerts_view.count, name: Watchguard
              Event and Alarms Malware Detected}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: log}]
    x_axis_label: Alerts
    series_colors: {}
    series_labels:
      alerts_view.count: New Alerts
    defaults_version: 1
    hidden_fields: []
    listen:
      date: alerts_view.datefilter
      alert_name: alerts_view.alert_abbr_nm
      Severity: alerts_view.severity
    row: 0
    col: 14
    width: 10
    height: 5
  filters:
  - name: date
    title: date
    type: date_filter
    default_value: 7 days
    allow_multiple_values: true
    required: false
  - name: alert_name
    title: alert_name
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: itd
    explore: alerts_view
    listens_to_filters: []
    field: alerts_view.alert_abbr_nm
  - name: Severity
    title: Severity
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: itd
    explore: alerts_view
    listens_to_filters: []
    field: alerts_view.severity
