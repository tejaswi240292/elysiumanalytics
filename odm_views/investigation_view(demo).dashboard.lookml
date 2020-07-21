- dashboard: investigation_viewdemo
  title: investigation_view(demo)
  layout: newspaper
  elements:
  - title: Endpoint FileActivity
    name: Endpoint FileActivity
    model: odm
    explore: sysmon_odm
    type: looker_grid
    fields: [sysmon_odm.src_user_name, sysmon_odm.event_id, sysmon_odm.object_type,
      sysmon_odm.src_host, sysmon_odm.event_time_date, sysmon_odm.src_ip, sysmon_odm.count]
    filters: {}
    sorts: [sysmon_odm.event_time_date desc]
    limit: 500
    total: true
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: gray
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
      sysmon_odm.src_user_name: Account Name
      sysmon_odm.event_id: Event Id
      sysmon_odm.object_type: Category
      sysmon_odm.src_host: Hostname
      sysmon_odm.event_time_date: Event Time
      sysmon_odm.count: Volume
    series_cell_visualizations:
      sysmon_odm.count:
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
      date: sysmon_odm.event_time_date
      Ip: sysmon_odm.src_ip
    row: 7
    col: 0
    width: 24
    height: 8
  - title: Suspicious Sites
    name: Suspicious Sites
    model: odm
    explore: sysmon_odm
    type: looker_grid
    fields: [sysmon_odm.event_time_date, sysmon_odm.src_ip, sysmon_odm.dst_ip, sysmon_odm.image_name,
      sysmon_odm.src_user_name, sysmon_odm.count]
    filters:
      sysmon_odm.dst_ip: -"[Null]"
    sorts: [sysmon_odm.event_time_date desc]
    limit: 500
    total: true
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: gray
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
      sysmon_odm.event_time_date: Event Time
      sysmon_odm.image_name: Image
      sysmon_odm.src_user_name: Username
      sysmon_odm.count: Volume
    series_cell_visualizations:
      sysmon_odm.count:
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
      date: sysmon_odm.event_time_date
      Ip: sysmon_odm.src_ip
    row: 15
    col: 0
    width: 24
    height: 9
  - title: Network Investigation
    name: Network Investigation
    model: odm
    explore: wgtraffic_odm
    type: looker_grid
    fields: [wgtraffic_odm.dst_ip, wgtraffic_odm.dst_port, wgtraffic_odm.src_ip, wgtraffic_odm.src_port,
      wgtraffic_odm.event_time_date, wgtraffic_odm.src_user_name, wgtraffic_odm.count]
    filters: {}
    sorts: [wgtraffic_odm.event_time_date desc]
    limit: 500
    total: true
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: gray
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
      wgtraffic_odm.dst_ip: Ip Dst Addr
      wgtraffic_odm.dst_port: Ip Dst Port
      wgtraffic_odm.src_ip: Ip Src Addr
      wgtraffic_odm.src_port: Ip Src port
      wgtraffic_odm.event_time_date: Event Time
      wgtraffic_odm.count: Volume
    series_cell_visualizations:
      wgtraffic_odm.count:
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
      date: wgtraffic_odm.event_time_date
      Ip: wgtraffic_odm.src_ip
      Port: wgtraffic_odm.dst_port
    row: 0
    col: 0
    width: 24
    height: 7
  filters:
  - name: date
    title: date
    type: date_filter
    default_value: 7 days
    allow_multiple_values: true
    required: false
  - name: Ip
    title: Ip
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: odm
    explore: wgtraffic_odm
    listens_to_filters: [Port]
    field: wgtraffic_odm.src_ip
  - name: Port
    title: Port
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: odm
    explore: wgtraffic_odm
    listens_to_filters: [Ip]
    field: wgtraffic_odm.src_port
