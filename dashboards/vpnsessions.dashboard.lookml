- dashboard: watchguard_vpn_connection_sessions
  title: WatchGuard VPN Connection Sessions
  layout: newspaper
  elements:
  - title: WatchGuard Sessions Details
    name: WatchGuard Sessions Details
    model: itd
    explore: watchguard_sessions
    type: table
    fields: [watchguard_sessions.session_start_datetime_minute, watchguard_sessions.session_end_datetime_minute,
      watchguard_sessions.session_status, watchguard_sessions.session_end_type, watchguard_sessions.user_type,
      watchguard_sessions.user_name, watchguard_sessions.ip_src_addr_nat, watchguard_sessions.ip_src_addr,
      watchguard_sessions.src_ip_geo_city, watchguard_sessions.src_ip_geo_country,
      watchguard_sessions.watchguard_host]
    filters:
      watchguard_sessions.session_start_datetime_date: 7 days
    sorts: [watchguard_sessions.session_start_datetime_minute desc]
    limit: 500
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: true
    hide_row_totals: false
    table_theme: transparent
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
    series_types: {}
    defaults_version: 1
    series_column_widths:
      watchguard_sessions.session_end_type: 113
    listen:
      Date: watchguard_sessions.session_start_datetime_minute
      Session Status: watchguard_sessions.session_status
      User Name: watchguard_sessions.user_name
    row: 2
    col: 0
    width: 24
    height: 6
  - title: Count of WatchGuard sessions by Device
    name: Count of WatchGuard sessions by Device
    model: itd
    explore: watchguard_sessions
    type: looker_line
    fields: [watchguard_sessions.session_end_datetime_date, watchguard_sessions.watchguard_host,
      watchguard_sessions.count]
    pivots: [watchguard_sessions.watchguard_host]
    fill_fields: [watchguard_sessions.session_end_datetime_date]
    filters:
      watchguard_sessions.session_end_datetime_date: 7 days
    sorts: [watchguard_sessions.count desc 0, watchguard_sessions.watchguard_host]
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
    legend_position: center
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    y_axes: [{label: Volume, orientation: left, series: [{axisId: watchguard_sessions.count,
            id: SSTECH_Dallas_XTM5 - watchguard_sessions.count, name: SSTECH_Dallas_XTM5},
          {axisId: watchguard_sessions.count, id: SSTECH_India_M370 - watchguard_sessions.count,
            name: SSTECH_India_M370}, {axisId: watchguard_sessions.count, id: SSTECH_TPA_XTM_525
              - watchguard_sessions.count, name: SSTECH_TPA_XTM_525}, {axisId: watchguard_sessions.count,
            id: SSTECH_VA_XTM_525 - watchguard_sessions.count, name: SSTECH_VA_XTM_525},
          {axisId: watchguard_sessions.count, id: SSTECH_VIZAG_M400 - watchguard_sessions.count,
            name: SSTECH_VIZAG_M400}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: 0
    hide_legend: false
    series_types: {}
    series_colors:
      watchguard_sessions.count: "#3EB0D5"
    series_labels:
      watchguard_sessions.count: Volume
    series_point_styles:
      watchguard_sessions.count: auto
    trend_lines: []
    defaults_version: 1
    groupBars: true
    labelSize: 10pt
    showLegend: true
    title_hidden: true
    listen:
      Date: watchguard_sessions.session_start_datetime_minute
      Session Status: watchguard_sessions.session_status
      User Name: watchguard_sessions.user_name
    row: 10
    col: 0
    width: 10
    height: 6
  - title: Session Status
    name: Session Status
    model: itd
    explore: watchguard_sessions
    type: looker_bar
    fields: [watchguard_sessions.session_status, watchguard_sessions.count]
    filters:
      watchguard_sessions.session_start_datetime_date: 7 days
    sorts: [watchguard_sessions.count desc]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hide_legend: false
    series_types: {}
    series_colors:
      watchguard_sessions.count: "#72D16D"
    series_labels:
      watchguard_sessions.count: Volume
    defaults_version: 1
    show_null_points: true
    interpolation: linear
    listen:
      Date: watchguard_sessions.session_start_datetime_minute
      Session Status: watchguard_sessions.session_status
      User Name: watchguard_sessions.user_name
    row: 10
    col: 10
    width: 7
    height: 6
  - title: WatchGuard Session Types
    name: WatchGuard Session Types
    model: itd
    explore: watchguard_sessions
    type: looker_pie
    fields: [watchguard_sessions.user_type, watchguard_sessions.count]
    filters:
      watchguard_sessions.session_start_datetime_date: 7 days
    sorts: [watchguard_sessions.count desc]
    limit: 500
    value_labels: legend
    label_type: lab
    series_colors:
      IPSec VPN: "#B1399E"
    series_types: {}
    defaults_version: 1
    listen:
      Date: watchguard_sessions.session_start_datetime_minute
      Session Status: watchguard_sessions.session_status
      User Name: watchguard_sessions.user_name
    row: 10
    col: 17
    width: 7
    height: 6
  - title: More Watchguard Session For Users
    name: More Watchguard Session For Users
    model: itd
    explore: watchguard_sessions
    type: looker_column
    fields: [watchguard_sessions.user_name, watchguard_sessions.count]
    filters:
      watchguard_sessions.session_start_datetime_date: 7 days
      watchguard_sessions.count: ">30"
    sorts: [watchguard_sessions.count desc]
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
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    series_types: {}
    series_colors:
      watchguard_sessions.count: "#E57947"
    series_labels:
      watchguard_sessions.count: Volume
    x_axis_label_rotation: 270
    show_dropoff: false
    defaults_version: 1
    listen:
      Date: watchguard_sessions.session_start_datetime_minute
      Session Status: watchguard_sessions.session_status
      User Name: watchguard_sessions.user_name
    row: 18
    col: 0
    width: 9
    height: 7
  - title: Locations of the VPN sessions
    name: Locations of the VPN sessions
    model: itd
    explore: watchguard_sessions
    type: looker_map
    fields: [watchguard_sessions.src_location, watchguard_sessions.count]
    filters:
      watchguard_sessions.session_start_datetime_date: 7 days
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
    listen:
      Date: watchguard_sessions.session_start_datetime_minute
      Session Status: watchguard_sessions.session_status
      User Name: watchguard_sessions.user_name
    row: 18
    col: 9
    width: 15
    height: 7
  - title: Failed Login
    name: Failed Login
    model: odm
    explore: wgevent_odm
    type: table
    fields: [wgevent_odm.event_time_minute, wgevent_odm.rpt_host, wgevent_odm.src_user_name,
      wgevent_odm.src_ip, wgevent_odm.msg, wgevent_odm.src_geo_city, wgevent_odm.src_geo_country,
      wgevent_odm.src_geo_lat, wgevent_odm.src_geo_long]
    filters:
      wgevent_odm.event_time_date: 7 days
      wgevent_odm.event_id: '11000005'
    sorts: [wgevent_odm.event_time_minute desc]
    limit: 500
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: transparent
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
    defaults_version: 1
    hidden_fields: []
    series_types: {}
    listen:
      Date: wgevent_odm.event_time_minute
      User Name: wgevent_odm.src_user_name
    row: 27
    col: 0
    width: 24
    height: 4
  filters:
  - name: Date
    title: Date
    type: field_filter
    default_value: 7 days
    allow_multiple_values: true
    required: false
    model: itd
    explore: watchguard_sessions
    listens_to_filters: []
    field: watchguard_sessions.session_start_datetime_minute
  - name: Session Status
    title: Session Status
    type: string_filter
    default_value: ''
    allow_multiple_values: true
    required: false
  - name: User Name
    title: User Name
    type: string_filter
    default_value: ''
    allow_multiple_values: true
    required: false
