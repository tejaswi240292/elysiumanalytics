- dashboard: activesync_and_outlook_web_access_sessions
  title: ActiveSync and Outlook Web Access Sessions
  layout: newspaper
  elements:
  - title: Device Connectivity Details (ActiveSync, OWA)
    name: Device Connectivity Details (ActiveSync, OWA)
    model: itd
    explore: iis_active
    type: table
    fields: [iis_active.session_start_minute, iis_active.session_end_minute, iis_active.occurence,
      iis_active.src_user_name, iis_active.device, iis_active.device_version]
    filters: {}
    sorts: [iis_active.session_start_minute desc]
    limit: 1000
    total: true
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
    series_labels:
      iis_active.session_start_minute: Earliest Session Start Time MINUTE
      iis_active.session_end_minute: Last Session End Time MINUTE
      iis_active.occurence: Count of Sessions
      iis_active.device: Device Type
      iis_active.count: Volume
      iis_active.src_user_name: Username
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    transpose: false
    truncate_text: true
    size_to_fit: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_cell_visualizations:
      iis_active.count:
        is_active: false
    header_font_color: ''
    header_background_color: ''
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
    hidden_fields: [iis_active.device_version]
    listen:
      Event Date: iis_active.datefilter
      User: iis_active.User
    row: 0
    col: 0
    width: 11
    height: 8
  - title: Number of Sessions per User
    name: Number of Sessions per User
    model: itd
    explore: iis_active
    type: table
    fields: [iis_active.session_start_minute, iis_active.session_end_minute, iis_active.src_user_name,
      iis_active.device, iis_active.device_version, iis_active.occurence, iis_active.count]
    filters: {}
    sorts: [iis_active.session_start_minute desc]
    limit: 1000
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
    series_labels:
      iis_active.session_start_date: Earliest Session Start Time
      iis_active.session_end_date: Last Session End Time
      iis_active.occurence: Count of Sessions
      iis_active.cs_username: Username
      iis_active.device: Device Type
      iis_active.session_start_minute: Earliest Session Start Time
      iis_active.session_end_minute: Latest Session End Time
      iis_active.src_user_name: Username
    transpose: false
    truncate_text: true
    size_to_fit: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_cell_visualizations:
      iis_active.count:
        is_active: true
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
    hidden_fields: [iis_active.count]
    listen:
      Event Date: iis_active.datefilter
      User: iis_active.User
    row: 15
    col: 8
    width: 16
    height: 9
  - title: User Device Email Sessions (ActiveSync, OWA)
    name: User Device Email Sessions (ActiveSync, OWA)
    model: itd
    explore: iis_active2
    type: table
    fields: [iis_active2.event_time_hour, iis_active2.src_user_name, iis_active2.device,
      iis_active2.rpt_host, iis_active2.src_ip, iis_active2.in_bytes, iis_active2.out_bytes,
      iis_active2.dst_port, iis_active2.http_status_detail, iis_active2.http_substatus_detail,
      iis_active2.encryption_details, iis_active2.count, iis_active2.src_geo_city,
      iis_active2.src_geo_country]
    filters:
      iis_active2.src_user_name: "-Anonymous User"
    sorts: [iis_active2.event_time_hour desc]
    limit: 5000
    total: true
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
    series_labels:
      iis_active2.src_user_name: Username
      iis_active2.rpt_host: Computer Name
      iis_active2.in_bytes: Bytes Received
      iis_active2.out_bytes: Bytes Sent
      iis_active2.src_geo_city: Client Location City
      iis_active2.src_geo_country: Client Location Country
      iis_active2.count: Volume
    transpose: false
    truncate_text: true
    size_to_fit: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_column_widths:
      iis_active2.dst_port: 84
    series_cell_visualizations:
      iis_active2.count:
        is_active: false
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
    listen:
      Event Date: iis_active2.datefilter
      User: iis_active2.User
    row: 8
    col: 0
    width: 24
    height: 7
  - title: User Geo Location Details (ActiveSync, OWA)
    name: User Geo Location Details (ActiveSync, OWA)
    model: itd
    explore: iis_active2
    type: looker_map
    fields: [iis_active2.count, iis_active2.src_location]
    filters:
      iis_active2.src_user_name: "-Anonymous User"
    sorts: [iis_active2.count desc]
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
      Event Date: iis_active2.datefilter
      User: iis_active2.User
    row: 0
    col: 11
    width: 13
    height: 8
  - title: More No of Sessions Per User Chart
    name: More No of Sessions Per User Chart
    model: itd
    explore: iis_active
    type: looker_column
    fields: [iis_active.src_user_name, iis_active.Count_of_sessions]
    filters: {}
    limit: 500
    dynamic_fields: [{measure: count_of_sessions, based_on: iis_active.occurence,
        type: sum, label: Count of Sessions, expression: !!null '', value_format: !!null '',
        value_format_name: !!null '', _kind_hint: measure, _type_hint: number}]
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
    limit_displayed_rows: true
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
    x_axis_label: Username
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '10'
    series_types: {}
    label_color: []
    x_axis_label_rotation: 270
    defaults_version: 1
    listen:
      Event Date: iis_active.datefilter
      User: iis_active.User
    row: 15
    col: 0
    width: 8
    height: 9
  filters:
  - name: Event Date
    title: Event Date
    type: date_filter
    default_value: 7 days
    allow_multiple_values: true
    required: false
  - name: User
    title: User
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: itd
    explore: iis_active
    listens_to_filters: []
    field: iis_active.User
